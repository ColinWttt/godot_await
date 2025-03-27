use crate::{FallibleSignalFuture, Gd, Inherits, Signal, SignalFuture};
use godot::classes::CanvasItem;

pub trait CanvasItemExt<T>
where
    T: Inherits<CanvasItem>,
{
    /// Emitted when the CanvasItem must redraw,
    /// after the related `NOTIFICATION_DRAW` notification, and before `_draw()` is called.
    ///
    /// Note: Deferred connections do not allow drawing through the draw_* methods.
    fn draw(&self) -> SignalFuture<()>;
    /// Emitted when the CanvasItem is hidden, i.e. it's no longer visible in the tree (see `is_visible_in_tree()`).
    fn hidden(&self) -> SignalFuture<()>;
    /// Emitted when the CanvasItem's boundaries (position or size) change,
    /// or when an action took place that may have affected these boundaries (e.g. changing Sprite2D.texture).
    fn item_rect_changed(&self) -> SignalFuture<()>;
    /// Emitted when the CanvasItem's visibility changes,
    /// either because its own visible property changed or because its visibility in the tree changed (see `is_visible_in_tree()`).
    fn visibility_changed(&self) -> SignalFuture<()>;

    fn draw_fallible(&self) -> FallibleSignalFuture<()>;
    fn hidden_fallible(&self) -> FallibleSignalFuture<()>;
    fn item_rect_changed_fallible(&self) -> FallibleSignalFuture<()>;
    fn visibility_changed_fallible(&self) -> FallibleSignalFuture<()>;
}

impl<T> CanvasItemExt<T> for Gd<T>
where
    T: Inherits<CanvasItem>,
{
    #[inline]
    fn draw(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "draw").to_future::<()>()
    }
    #[inline]
    fn hidden(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "hidden").to_future::<()>()
    }
    #[inline]
    fn item_rect_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "item_rect_changed").to_future::<()>()
    }
    #[inline]
    fn visibility_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "visibility_changed").to_future::<()>()
    }
    #[inline]
    fn draw_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "draw").to_fallible_future::<()>()
    }
    #[inline]
    fn hidden_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "hidden").to_fallible_future::<()>()
    }
    #[inline]
    fn item_rect_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "item_rect_changed").to_fallible_future::<()>()
    }
    #[inline]
    fn visibility_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "visibility_changed").to_fallible_future::<()>()
    }
}
