use godot::{
    classes::{BaseButton, Tween},
    obj::Gd,
};

use crate::{tween::TweenExt, *};

fn test(gd: Gd<Tween>) {
    gd.loop_finished();
}
