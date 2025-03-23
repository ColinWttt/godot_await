set windows-shell := ["cmd", "/C"]

build:
    cd godot_await && cargo fmt && cargo build
publish:
    cd godot_await && cargo publish --registry crates-io
clippy-s:
    cd godot_await && cargo clippy --all-targets -- -W clippy::all -W clippy::pedantic -W clippy::nursery -W clippy::cargo