// from https://github.com/smol-rs/futures-lite/blob/master/src/future.rs

pub use core::future::{Future, Pending, Ready, pending, ready};

use core::pin::Pin;

use pin_project_lite::pin_project;

use std::{
    any::Any,
    panic::{AssertUnwindSafe, UnwindSafe, catch_unwind},
};

use core::task::{Context, Poll};

/// Joins two futures, waiting for both to complete.
///
/// # Examples
///
/// ```
/// use godot_await::future;
///
/// # spin_on::spin_on(async {
/// let a = async { 1 };
/// let b = async { 2 };
///
/// assert_eq!(future::zip(a, b).await, (1, 2));
/// # })
/// ```
pub fn zip<F1, F2>(future1: F1, future2: F2) -> Zip<F1, F2>
where
    F1: Future,
    F2: Future,
{
    Zip {
        future1: Some(future1),
        future2: Some(future2),
        output1: None,
        output2: None,
    }
}

pin_project! {
    /// Future for the [`zip()`] function.
    #[derive(Debug)]
    #[must_use = "futures do nothing unless you `.await` or poll them"]
    pub struct Zip<F1, F2>
    where
        F1: Future,
        F2: Future,
    {
        #[pin]
        future1: Option<F1>,
        output1: Option<F1::Output>,
        #[pin]
        future2: Option<F2>,
        output2: Option<F2::Output>,
    }
}

/// Extracts the contents of two options and zips them, handling `(Some(_), None)` cases
fn take_zip_from_parts<T1, T2>(o1: &mut Option<T1>, o2: &mut Option<T2>) -> Poll<(T1, T2)> {
    match (o1.take(), o2.take()) {
        (Some(t1), Some(t2)) => Poll::Ready((t1, t2)),
        (o1x, o2x) => {
            *o1 = o1x;
            *o2 = o2x;
            Poll::Pending
        }
    }
}

impl<F1, F2> Future for Zip<F1, F2>
where
    F1: Future,
    F2: Future,
{
    type Output = (F1::Output, F2::Output);

    fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        let mut this = self.project();

        if let Some(future) = this.future1.as_mut().as_pin_mut() {
            if let Poll::Ready(out) = future.poll(cx) {
                *this.output1 = Some(out);
                this.future1.set(None);
            }
        }

        if let Some(future) = this.future2.as_mut().as_pin_mut() {
            if let Poll::Ready(out) = future.poll(cx) {
                *this.output2 = Some(out);
                this.future2.set(None);
            }
        }

        take_zip_from_parts(this.output1, this.output2)
    }
}

/// Joins two fallible futures, waiting for both to complete or one of them to error.
///
/// # Examples
///
/// ```
/// use godot_await::future;
///
/// # spin_on::spin_on(async {
/// let a = async { Ok::<i32, i32>(1) };
/// let b = async { Err::<i32, i32>(2) };
///
/// assert_eq!(future::try_zip(a, b).await, Err(2));
/// # })
/// ```
pub fn try_zip<T1, T2, E, F1, F2>(future1: F1, future2: F2) -> TryZip<F1, T1, F2, T2>
where
    F1: Future<Output = Result<T1, E>>,
    F2: Future<Output = Result<T2, E>>,
{
    TryZip {
        future1: Some(future1),
        future2: Some(future2),
        output1: None,
        output2: None,
    }
}

pin_project! {
    /// Future for the [`try_zip()`] function.
    #[derive(Debug)]
    #[must_use = "futures do nothing unless you `.await` or poll them"]
    pub struct TryZip<F1, T1, F2, T2> {
        #[pin]
        future1: Option<F1>,
        output1: Option<T1>,
        #[pin]
        future2: Option<F2>,
        output2: Option<T2>,
    }
}

impl<T1, T2, E, F1, F2> Future for TryZip<F1, T1, F2, T2>
where
    F1: Future<Output = Result<T1, E>>,
    F2: Future<Output = Result<T2, E>>,
{
    type Output = Result<(T1, T2), E>;

    fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        let mut this = self.project();

        if let Some(future) = this.future1.as_mut().as_pin_mut() {
            if let Poll::Ready(out) = future.poll(cx) {
                match out {
                    Ok(t) => {
                        *this.output1 = Some(t);
                        this.future1.set(None);
                    }
                    Err(err) => return Poll::Ready(Err(err)),
                }
            }
        }

        if let Some(future) = this.future2.as_mut().as_pin_mut() {
            if let Poll::Ready(out) = future.poll(cx) {
                match out {
                    Ok(t) => {
                        *this.output2 = Some(t);
                        this.future2.set(None);
                    }
                    Err(err) => return Poll::Ready(Err(err)),
                }
            }
        }

        take_zip_from_parts(this.output1, this.output2).map(Ok)
    }
}

/// Returns the result of the future that completes first, preferring `future1` if both are ready.
///
///
/// # Examples
///
/// ```
/// use godot_await::future::{self, pending, ready};
///
/// # spin_on::spin_on(async {
/// assert_eq!(future::or(ready(1), pending()).await, 1);
/// assert_eq!(future::or(pending(), ready(2)).await, 2);
///
/// // The first future wins.
/// assert_eq!(future::or(ready(1), ready(2)).await, 1);
/// # })
/// ```
pub fn or<T, F1, F2>(future1: F1, future2: F2) -> Or<F1, F2>
where
    F1: Future<Output = T>,
    F2: Future<Output = T>,
{
    Or { future1, future2 }
}

pin_project! {
    /// Future for the [`or()`] function and the [`FutureExt::or()`] method.
    #[derive(Debug)]
    #[must_use = "futures do nothing unless you `.await` or poll them"]
    pub struct Or<F1, F2> {
        #[pin]
        future1: F1,
        #[pin]
        future2: F2,
    }
}

impl<T, F1, F2> Future for Or<F1, F2>
where
    F1: Future<Output = T>,
    F2: Future<Output = T>,
{
    type Output = T;

    fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        let this = self.project();

        if let Poll::Ready(t) = this.future1.poll(cx) {
            return Poll::Ready(t);
        }
        if let Poll::Ready(t) = this.future2.poll(cx) {
            return Poll::Ready(t);
        }
        Poll::Pending
    }
}

pin_project! {
    /// Future for the [`FutureExt::catch_unwind()`] method.
    #[derive(Debug)]
    #[must_use = "futures do nothing unless you `.await` or poll them"]
    pub struct CatchUnwind<F> {
        #[pin]
        inner: F,
    }
}

impl<F: Future + UnwindSafe> Future for CatchUnwind<F> {
    type Output = Result<F::Output, Box<dyn Any + Send>>;

    fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<Self::Output> {
        let this = self.project();
        catch_unwind(AssertUnwindSafe(|| this.inner.poll(cx)))?.map(Ok)
    }
}

/// Extension trait for [`Future`].
pub trait FutureExt: Future {
    /// Returns the result of `self` or `other` future, preferring `self` if both are ready.
    ///
    /// # Examples
    ///
    /// ```
    /// use godot_await::future::{pending, ready, FutureExt};
    ///
    /// # spin_on::spin_on(async {
    /// assert_eq!(ready(1).or(pending()).await, 1);
    /// assert_eq!(pending().or(ready(2)).await, 2);
    ///
    /// // The first future wins.
    /// assert_eq!(ready(1).or(ready(2)).await, 1);
    /// # })
    /// ```
    fn or<F>(self, other: F) -> Or<Self, F>
    where
        Self: Sized,
        F: Future<Output = Self::Output>,
    {
        Or {
            future1: self,
            future2: other,
        }
    }

    /// Catches panics while polling the future.
    ///
    /// # Examples
    ///
    /// ```
    /// use godot_await::future::FutureExt;
    ///
    /// # spin_on::spin_on(async {
    /// let fut1 = async {}.catch_unwind();
    /// let fut2 = async { panic!() }.catch_unwind();
    ///
    /// assert!(fut1.await.is_ok());
    /// assert!(fut2.await.is_err());
    /// # })
    /// ```
    fn catch_unwind(self) -> CatchUnwind<Self>
    where
        Self: Sized + UnwindSafe,
    {
        CatchUnwind { inner: self }
    }
}

impl<F: Future + ?Sized> FutureExt for F {}
