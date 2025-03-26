use crate::{FallibleSignalFuture, Gd, Inherits, Signal, SignalFuture};
use godot::classes::Viewport;

pub trait ViewportExt<T>
where
    T: Inherits<Viewport>,
{
    //todo
    // /// Emitted when a Control node grabs keyboard focus.
    // /// Note: A `Control` node losing focus doesn't cause this signal to be emitted.
    // fn gui_focus_changed(&self) -> SignalFuture<(Gd<Control>,)>;

    /// Emitted when the size of the viewport is changed, whether by resizing of window, or some other means.
    fn size_changed(&self) -> SignalFuture<()>;

    // fn gui_focus_changed_fallible(&self) -> FallibleSignalFuture<(Gd<Control>,)>;

    fn size_changed_fallible(&self) -> FallibleSignalFuture<()>;
}

impl<T> ViewportExt<T> for Gd<T>
where
    T: Inherits<Viewport>,
{
    #[inline]
    fn size_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "size_changed").to_future::<()>()
    }
    #[inline]
    fn size_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "size_changed").to_fallible_future::<()>()
    }
}
