//! Traits `BaseButtonExt`, `NodeExt`, `SceneTreeExt`, `TimerExt`, `TweenExt`.
//!
//! # Examples
//!
//! ```
//! use godot_await::prelude::*;
//! ```

#[doc(no_inline)]
pub use crate::classes::{
    audio::AudioStreamPlayerExt as _, base_button::BaseButtonExt as _, node::NodeExt as _,
    scene_tree::SceneTreeExt as _, timer::TimerExt as _, tween::TweenExt as _,
};

pub use crate::wait::{wait, wait_ex};
