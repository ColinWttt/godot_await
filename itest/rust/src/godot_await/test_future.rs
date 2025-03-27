use godot::classes::Button;
use godot::meta::ToGodot;
use godot::obj::NewAlloc;
use godot::task;
use godot::task::TaskHandle;
use std::time::Instant;

use godot_await::future::{or, zip};
use godot_await::prelude::*;

use crate::framework::itest;

#[itest(async)]
fn zip_test() -> TaskHandle {
    let mut button = Button::new_alloc();
    let button_ref = button.clone();

    let task_handle = task::spawn(async move {
        let ret = zip(button_ref.button_down(), button_ref.toggled()).await;
        assert_eq!(ret, ((), (true,)));
    });

    button.emit_signal("button_down", &[]);
    button.emit_signal("toggled", &[true.to_variant()]);

    task_handle
}

#[itest(async)]
fn or_test_1() -> TaskHandle {
    let mut button = Button::new_alloc();
    let button_ref = button.clone();

    let task_handle = task::spawn(async move {
        let start = Instant::now();
        or(wait(0.5), button_ref.button_down()).await;
        assert!((Instant::now() - start).as_secs_f32() < 0.01);
    });

    button.emit_signal("button_down", &[]);

    task_handle
}

#[itest(async)]
fn or_test_2() -> TaskHandle {
    let button = Button::new_alloc();

    task::spawn(async move {
        let start = Instant::now();
        or(button.button_down(), wait(0.1)).await;
        println!(
            "or_test_2 elasp sec:{}",
            (Instant::now() - start).as_secs_f32()
        );
        assert!((Instant::now() - start).as_secs_f32() >= 0.09);
    })
}

#[itest(async)]
fn or_test_self_right() -> TaskHandle {
    let button = Button::new_alloc();

    task::spawn(async move {
        let start = Instant::now();
        button.button_down().or(wait(0.1)).await;
        assert!((Instant::now() - start).as_secs_f32() > 0.09);
    })
}
#[itest(async)]
fn or_test_self_left() -> TaskHandle {
    let mut button = Button::new_alloc();
    let button_ref = button.clone();

    let task_handle = task::spawn(async move {
        let start = Instant::now();
        button_ref.button_down().or(wait(0.1)).await;
        assert!((Instant::now() - start).as_secs_f32() < 0.001);
    });
    button.emit_signal("button_down", &[]);
    task_handle
}

#[itest(async)]
fn or_test_catch_unwind() -> TaskHandle {
    let mut button = Button::new_alloc();
    let button_ref = button.clone();

    let task_handle = task::spawn(async move {
        let result = button_ref.button_down().catch_unwind().await;
        assert!(result.is_err());
    });
    button.call_deferred("free", &[]);

    task_handle
}
