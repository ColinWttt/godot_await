#[cfg(feature = "zip_or")]
pub mod futures;
pub mod prelude;
mod utils;
pub mod wait;

pub mod classes {
    pub mod animated_sprite;
    pub mod audio;
    pub mod base_button;
    pub mod canvas_item;
    pub mod control;
    pub mod node;
    pub mod scene_tree;
    pub mod timer;
    pub mod tween;
    pub mod viewport;
}

pub(crate) use godot::builtin::Signal;
pub(crate) use godot::obj::{Gd, Inherits};
pub(crate) use godot::task::{FallibleSignalFuture, SignalFuture};
