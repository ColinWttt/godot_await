/*
 * Copyright (c) godot-rust; Bromeon and contributors.
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

use std::path::Path;

fn main() {
    // Godot currently still uses local /gen folder. If this changes one day (no good reason right now),
    // IntegrationTest class could get a func get_out_dir() which returns env!("OUT_DIR") and is called from GDScript.
    let out_dir = std::env::var("OUT_DIR").unwrap();
    let rust_output_dir = Path::new(&out_dir);

    let rust_file = rust_output_dir.join("gen_ffi.rs");

    std::fs::create_dir_all(rust_output_dir).expect("create Rust parent dir");

    rustfmt_if_needed(vec![rust_file]);

    godot_bindings::emit_godot_version_cfg();
}

// TODO remove, or remove code duplication with codegen
fn rustfmt_if_needed(out_files: Vec<std::path::PathBuf>) {
    //print!("Format {} generated files...", out_files.len());

    let mut process = std::process::Command::new("rustup");
    process
        .arg("run")
        .arg("stable")
        .arg("rustfmt")
        .arg("--edition=2021");

    for file in out_files {
        //println!("Format {file:?}");
        process.arg(file);
    }

    match process.output() {
        Ok(_) => println!("Done."),
        Err(err) => {
            println!("Failed.");
            println!("Error: {err}");
        }
    }
}
