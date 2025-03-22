build:
    cargo fmt && cargo build
publish:
    cargo publish --registry crates-io
clippy-s:
    cargo clippy --all-targets -- -W clippy::all -W clippy::pedantic -W clippy::nursery -W clippy::cargo
