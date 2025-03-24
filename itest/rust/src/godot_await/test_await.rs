use std::time::Instant;

use futures::join;

use godot::classes::{Button, Engine, Node, Node2D, RefCounted, SceneTree};
use godot::meta::ToGodot;
use godot::obj::{Base, Gd, NewAlloc};
use godot::prelude::{godot_api, GodotClass};
use godot::task;
use godot::task::TaskHandle;
use godot_await::button::BaseButtonExt;
use godot_await::node::NodeExt;

use godot_await::{wait, wait_ex};

use crate::framework::{itest, TestContext};

#[derive(GodotClass)]
#[class(init)]
struct AsyncRefCounted {
    base: Base<RefCounted>,
}

#[derive(GodotClass)]
#[class(init,base=Node2D)]
struct AsyncNode2D {
    base: Base<Node2D>,
}

#[godot_api]
impl AsyncRefCounted {
    #[signal]
    fn u32_signal(value: u32);
}

fn get_tree() -> Gd<SceneTree> {
    Engine::singleton()
        .get_main_loop()
        .expect("ERR(godot_await):get MainLoop failed")
        .try_cast()
        .expect("ERR(godot_await):cast SceneTree failed")
}
#[itest(async)]
fn wait_test() -> TaskHandle {
    task::spawn(async move {
        let start = Instant::now();
        wait(0.01).await;
        assert!((Instant::now() - start).as_secs_f64() > 0.009);

        let start = Instant::now();
        wait_ex(&mut get_tree(), 0.01)
            .process_always(false)
            .done()
            .await;
        assert!((Instant::now() - start).as_secs_f64() > 0.009);
    })
}

#[itest(async)]
fn node_test(test_context: &TestContext) -> TaskHandle {
    let node = Node::new_alloc();
    let node_ref = node.clone();
    let mut tree = test_context.scene_tree.clone();

    task::spawn(async move {
        node_ref.tree_entered().await;
    });

    tree.add_child(&node);

    let node_ref = node.clone();

    let task_handle = task::spawn(async move {
        node_ref.tree_exited().await;
    });
    tree.remove_child(&node);

    task_handle
}

// #[itest(async)]
// fn button_panic_test(test_context: &TestContext) -> TaskHandle {
//     let mut button = Button::new_alloc();
//     let button_ref = button.clone();

//     let task_handle = task::spawn(async move {
//         button_ref.pressed().await;
//     });

//     // button.emit_signal("pressed", &[]);
//     button.call_deferred("free", &[]);

//     task_handle
// }

#[itest(async)]
fn button_test() -> TaskHandle {
    let mut button = Button::new_alloc();
    let button_ref = button.clone();

    let task_handle = task::spawn(async move {
        let ret = join!(
            button_ref.button_down(),
            button_ref.button_up(),
            button_ref.pressed(),
            button_ref.toggled(),
        );

        assert_eq!(ret, ((), (), (), (true,)))
    });

    button.emit_signal("button_down", &[]);
    button.emit_signal("button_up", &[]);
    button.emit_signal("toggled", &[true.to_variant()]);
    button.emit_signal("pressed", &[]);

    task_handle
}
