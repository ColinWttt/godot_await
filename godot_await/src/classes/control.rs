use crate::{FallibleSignalFuture, Gd, Inherits, Signal, SignalFuture};
use godot::classes::{Control, InputEvent};

pub trait ControlExt<T>
where
    T: Inherits<Control>,
{
    /// Emitted when the node gains focus.
    fn focus_entered(&self) -> SignalFuture<()>;
    /// Emitted when the node loses focus.
    fn focus_exited(&self) -> SignalFuture<()>;
    /// Emitted when the node receives an `InputEvent`.
    fn gui_input(&self) -> SignalFuture<(Gd<InputEvent>,)>;
    /// Emitted when the node's minimum size changes.
    fn minimum_size_changed(&self) -> SignalFuture<()>;
    /// Emitted when the mouse cursor enters the control's (or any child control's) visible area,
    /// that is not occluded behind other Controls or Windows,
    /// provided its mouse_filter lets the event reach it and regardless if it's currently focused or not.
    ///
    /// Note: CanvasItem.z_index doesn't affect, which Control receives the signal.
    fn mouse_entered(&self) -> SignalFuture<()>;
    /// Emitted when the mouse cursor leaves the control's (and all child control's) visible area,
    /// that is not occluded behind other Controls or Windows,
    /// provided its mouse_filter lets the event reach it and regardless if it's currently focused or not.
    ///
    /// Note: `CanvasItem.z_index` doesn't affect, which Control receives the signal.
    fn mouse_exited(&self) -> SignalFuture<()>;
    /// Emitted when the control changes size.
    fn resized(&self) -> SignalFuture<()>;
    /// Emitted when one of the size flags changes.
    /// See `size_flags_horizontal` and `size_flags_vertical`.
    fn size_flags_changed(&self) -> SignalFuture<()>;
    /// Emitted when the `NOTIFICATION_THEME_CHANGED` notification is sent.
    fn theme_changed(&self) -> SignalFuture<()>;

    fn focus_entered_fallible(&self) -> FallibleSignalFuture<()>;
    fn focus_exited_fallible(&self) -> FallibleSignalFuture<()>;
    fn gui_input_fallible(&self) -> FallibleSignalFuture<(Gd<InputEvent>,)>;
    fn minimum_size_changed_fallible(&self) -> FallibleSignalFuture<()>;
    fn mouse_entered_fallible(&self) -> FallibleSignalFuture<()>;
    fn mouse_exited_fallible(&self) -> FallibleSignalFuture<()>;
    fn resized_fallible(&self) -> FallibleSignalFuture<()>;
    fn size_flags_changed_fallible(&self) -> FallibleSignalFuture<()>;
    fn theme_changed_fallible(&self) -> FallibleSignalFuture<()>;
}

impl<T> ControlExt<T> for Gd<T>
where
    T: Inherits<Control>,
{
    #[inline]
    fn focus_entered(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "focus_entered").to_future::<()>()
    }
    #[inline]
    fn focus_exited(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "focus_exited").to_future::<()>()
    }
    #[inline]
    fn gui_input(&self) -> SignalFuture<(Gd<InputEvent>,)> {
        Signal::from_object_signal(self, "gui_input").to_future::<(Gd<InputEvent>,)>()
    }
    #[inline]
    fn minimum_size_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "minimum_size_changed").to_future::<()>()
    }
    #[inline]
    fn mouse_entered(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "mouse_entered").to_future::<()>()
    }
    #[inline]
    fn mouse_exited(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "mouse_exited").to_future::<()>()
    }
    #[inline]
    fn resized(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "resized").to_future::<()>()
    }
    #[inline]
    fn size_flags_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "size_flags_changed").to_future::<()>()
    }
    #[inline]
    fn theme_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "theme_changed").to_future::<()>()
    }
    #[inline]
    fn focus_entered_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "focus_entered").to_fallible_future::<()>()
    }
    #[inline]
    fn focus_exited_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "focus_exited").to_fallible_future::<()>()
    }
    #[inline]
    fn gui_input_fallible(&self) -> FallibleSignalFuture<(Gd<InputEvent>,)> {
        Signal::from_object_signal(self, "gui_input").to_fallible_future::<(Gd<InputEvent>,)>()
    }
    #[inline]
    fn minimum_size_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "minimum_size_changed").to_fallible_future::<()>()
    }
    #[inline]
    fn mouse_entered_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "mouse_entered").to_fallible_future::<()>()
    }
    #[inline]
    fn mouse_exited_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "mouse_exited").to_fallible_future::<()>()
    }
    #[inline]
    fn resized_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "resized").to_fallible_future::<()>()
    }
    #[inline]
    fn size_flags_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "size_flags_changed").to_fallible_future::<()>()
    }
    #[inline]
    fn theme_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "theme_changed").to_fallible_future::<()>()
    }
}
