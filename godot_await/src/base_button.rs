use crate::{FallibleSignalFuture, Gd, Inherits, Signal, SignalFuture};
use godot::classes::BaseButton;

pub trait BaseButtonExt<T>
where
    T: Inherits<BaseButton>,
{
    /// Emitted when the button stops being held down.
    fn button_up(&self) -> SignalFuture<()>;
    /// Emitted when the button starts being held down.
    fn button_down(&self) -> SignalFuture<()>;
    /// Emitted when the button was just toggled between pressed and normal states (only if `toggle_mode` is active).
    /// The new state is contained in the `toggled_on` argument.
    /// # Return
    /// (`toggled_on`: bool,)
    fn toggled(&self) -> SignalFuture<(bool,)>;
    /// Emitted when the button is toggled or pressed.
    /// This is on `button_down` if `action_mode` is `ACTION_MODE_BUTTON_PRESS` and on `button_up` otherwise.
    /// If you need to know the button's pressed state (and `toggle_mode` is active), use `button_toggled` instead.
    fn pressed(&self) -> SignalFuture<()>;
    /// `button_up`fallible
    fn button_up_fallible(&self) -> FallibleSignalFuture<()>;
    /// `button_down`fallible
    fn button_down_fallible(&self) -> FallibleSignalFuture<()>;
    /// `toggled`fallible
    fn toggled_fallible(&self) -> FallibleSignalFuture<(bool,)>;
    /// `pressed`fallible
    fn pressed_fallible(&self) -> FallibleSignalFuture<()>;
}

impl<T> BaseButtonExt<T> for Gd<T>
where
    T: Inherits<BaseButton>,
{
    #[inline]
    fn button_down(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "button_down").to_future::<()>()
    }
    #[inline]
    fn button_up(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "button_up").to_future::<()>()
    }
    #[inline]
    fn pressed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "pressed").to_future::<()>()
    }
    #[inline]
    fn toggled(&self) -> SignalFuture<(bool,)> {
        Signal::from_object_signal(self, "toggled").to_future::<(bool,)>()
    }
    #[inline]
    fn button_down_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "button_down").to_fallible_future::<()>()
    }
    #[inline]
    fn button_up_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "button_up").to_fallible_future::<()>()
    }
    #[inline]
    fn pressed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "pressed").to_fallible_future::<()>()
    }
    #[inline]
    fn toggled_fallible(&self) -> FallibleSignalFuture<(bool,)> {
        Signal::from_object_signal(self, "toggled").to_fallible_future::<(bool,)>()
    }
}
