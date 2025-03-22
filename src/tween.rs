use crate::{Gd, Inherits, Signal, SignalFuture, FallibleSignalFuture};
use godot::classes::Tween;

pub trait TweenExt<T>
where
    T: Inherits<Tween>,
{
    // Emitted when the Tween has finished all tweening.
    // Never emitted when the Tween is set to infinite looping (see set_loops()).
    fn finished(&self) -> SignalFuture<()>;
    fn finished_fallible(&self) -> FallibleSignalFuture<()>;

    /// Emitted when one step of the Tween is complete, providing the step index.
    /// One step is either a single Tweener or a group of Tweeners running in parallel.
    /// # Retruns
    /// (idx: i64, )
    fn step_finished(&self) -> SignalFuture<(i64,)>;
    fn step_finished_fallible(&self) -> FallibleSignalFuture<(i64,)>;

    /// Emitted when a full loop is complete (see `set_loops()`), providing the loop index.
    /// This signal is not emitted after the final loop, use `tween_finished` instead for this case.
    /// # Retruns
    /// (`loop_count`: i64, )
    fn loop_finished(&self) -> SignalFuture<(i64,)>;
    fn loop_finished_fallible(&self) -> FallibleSignalFuture<(i64,)>;
}

impl<T> TweenExt<T> for Gd<T>
where
    T: Inherits<Tween>,
{
    #[inline]
    fn finished(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "finished").to_future::<()>()
    }
    #[inline]
    fn finished_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "finished").to_fallible_future::<()>()
    }
    #[inline]
    fn loop_finished(&self) -> SignalFuture<(i64,)> {
        Signal::from_object_signal(self, "loop_finished").to_future::<(i64,)>()
    }
    #[inline]
    fn loop_finished_fallible(&self) -> FallibleSignalFuture<(i64,)> {
        Signal::from_object_signal(self, "loop_finished").to_fallible_future::<(i64,)>()
    }
    #[inline]
    fn step_finished(&self) -> SignalFuture<(i64,)> {
        Signal::from_object_signal(self, "step_finished").to_future::<(i64,)>()
    }
    #[inline]
    fn step_finished_fallible(&self) -> FallibleSignalFuture<(i64,)> {
        Signal::from_object_signal(self, "step_finished").to_fallible_future::<(i64,)>()
    }
}
