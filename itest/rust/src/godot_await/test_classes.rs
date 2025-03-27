use std::time::Instant;

use godot::classes::{Button, Engine, Node, Node2D, RefCounted, SceneTree};
use godot::obj::{Base, Gd, NewAlloc};
use godot::prelude::{godot_api, GodotClass};
use godot::task;
use godot::task::TaskHandle;

// use godot_await::futures::{or, zip, FutureExt};
use godot_await::prelude::*;

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
        wait(0.5).await;
        println!("wait elasp sec:{}", (Instant::now() - start).as_secs_f32());
        assert!((Instant::now() - start).as_secs_f32() >= 0.4);

        let start = Instant::now();
        wait_ex(&mut get_tree(), 0.1)
            .process_always(false)
            .done()
            .await;
        println!(
            "wait_ex elasp sec:{}",
            (Instant::now() - start).as_secs_f32()
        );
        assert!((Instant::now() - start).as_secs_f32() >= 0.09);
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

#[itest(async)]
fn button_fallible_test() -> TaskHandle {
    let mut button = Button::new_alloc();
    let button_ref = button.clone();

    let task_handle = task::spawn(async move {
        let ret = button_ref.pressed_fallible().await;
        assert!(ret.is_err())
    });

    button.call_deferred("free", &[]);

    task_handle
}
