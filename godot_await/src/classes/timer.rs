use crate::{FallibleSignalFuture, Gd, Inherits, Signal, SignalFuture};
use godot::classes::Timer;

pub trait TimerExt<T>
where
    T: Inherits<Timer>,
{
    fn timeout(&self) -> SignalFuture<()>;
    fn timeout_fallible(&self) -> FallibleSignalFuture<()>;
}

impl<T> TimerExt<T> for Gd<T>
where
    T: Inherits<Timer>,
{
    #[inline]
    fn timeout(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "timeout").to_future::<()>()
    }
    #[inline]
    fn timeout_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "timeout").to_fallible_future::<()>()
    }
}
