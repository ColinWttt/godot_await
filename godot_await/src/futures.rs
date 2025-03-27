// #[doc(no_inline)]
use core::future::Future;
use core::pin::Pin;
use core::task::{Context, Poll};

use pin_project_lite::pin_project;

/// Joins two futures, waiting for both to complete.
///
/// # Examples
///
/// ```
/// use futures_lite::future;
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

/// Returns the result of the future that completes first, preferring `future1` if both are ready.
///
/// If you need to treat the two futures fairly without a preference for either, use the [`race()`]
/// function or the [`FutureExt::race()`] method.
///
/// # Examples
///
/// ```
/// use futures_lite::future::{self, pending, ready};
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
