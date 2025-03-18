use godot::classes::Viewport;

use crate::*;
//todo
// gui_focus_changed

#[inline]
pub fn viewport_size_changed(viewport: &Gd<Viewport>) -> SignalFuture<()> {
    Signal::from_object_signal(viewport, "size_changed").to_future::<()>()
}
