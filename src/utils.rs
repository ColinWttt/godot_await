use godot::classes::{Engine, SceneTree};
use godot::obj::Gd;

#[inline]
pub(crate) fn godot_tree() -> Gd<SceneTree> {
    Engine::singleton()
        .get_main_loop()
        .expect("ERR(godot_await):get MainLoop failed")
        .try_cast()
        .expect("ERR(godot_await):cast SceneTree failed")
}
