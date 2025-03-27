
# godot_await

A simple wrapper for awaiting Godot built-in signals in an async context.
It only depends on [`godot`](https://crates.io/crates/godot) by default.

## Usage

Add this to your `Cargo.toml`:

```toml
[dependencies]
godot_await =  { git = "https://github.com/ColinWttt/godot_await"}

```

## Examples

### Wait for a Duration

Using `godot_await`:

```rust
  wait(1.0).await;
```

Equivalent to:

```php
  // GDScript
  await get_tree().create_timer(1.0).timeout
```

```rust
  // Rust (without godot_await)
  let timer = Engine::singleton()
      .get_main_loop().unwrap()
      .cast::<SceneTree>().unwrap()
      .create_timer(1.0).unwrap();
  let signal = Signal::from_object_signal(&timer, "timeout");
  signal.to_future::<()>().await;
```

### Wait for tween finished

Using `godot_await`:

```rust
  tween.finished().await;
```

Equivalent to

```php
  // GDScript
  await tween.finished
```

```rust
  // Rust (without godot_await)
  let signal = Signal::from_object_signal(&tween, "finished");
  signal.to_future::<()>().await;
```

### The `_fallible` suffix

Function names with the `_fallible` suffix return `FallibleSignalFuture<(...)>`.

   >`FallibleSignalFuture`:The future might resolve to an error if the signal object is freed before the signal is emitted.[gdext repo](https://github.com/godot-rust/gdext/blob/62a7381b3b297038b053ab63b1ad87997f6cc1e2/godot-core/src/task/futures.rs#L166)

```rust
    task::spawn(async move {
        let result = button.pressed_fallible().await;
        assert!(result.is_err());
    });

    button.call_deferred("free", &[]);
```

## Crate Features

`godot_await` has no features enabled by default.

Optionally, the following dependencies can be enabled:
- `future` enables `zip`,`or`,`try_zip`,`wait_or`, using the [pin-project-lite](https://crates.io/crates/pin-project-lite) crate.
```rust
    // Joins two futures, waiting for both to complete.
    zip(tween.finished(),timer.timeout()).await;
    // Returns the result of the future that completes first.
    or(button.pressed(),wait(1.0)).await;
    // Equivalent to
    button.pressed().or(wait(1.0)).await;
```

## License

Licensed under either of

* Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or <http://www.apache.org/licenses/LICENSE-2.0>)
* MIT license ([LICENSE-MIT](LICENSE-MIT) or <http://opensource.org/licenses/MIT>)

at your option.
