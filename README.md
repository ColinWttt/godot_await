
# godot_await

A simple wrapper for awaiting Godot built-in signals in an async context.  
It only uses [`godot`](https://crates.io/crates/godot).

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
  // Rust
  let timer = Engine::singleton().get_main_loop().unwrap().cast().unwrap().create_timer(1.0);
  Signal::from_object_signal(&timer, "timeout").to_future::<()>().await
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
  // Rust
  let signal = Signal::from_object_signal(&tween, "finished");
  signal.to_future::<()>().await;
```

### Wait for multiple signals

These function returns `SignalFuture<(...)>`, allowing you to await them together.

```rust
  //with future-rs
  join!(timer.timeout(1.0, tween.finished()))
```

### The `_fallible` suffix

Function names with the `_fallible` suffix return `FallibleSignalFuture<(...)>`.

   >`FallibleSignalFuture`:The future might resolve to an error if the signal object is freed before the signal is emitted.[gdext repo](https://github.com/godot-rust/gdext/blob/master/godot-core/src/task/futures.rs#L166)

```rust
    task::spawn(async move {
        let result = button.pressed_fallible().await;
        assert!(result.is_err());
    });

    button.call_deferred("free", &[]);
```

## License

Licensed under either of

* Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or <http://www.apache.org/licenses/LICENSE-2.0>)
* MIT license ([LICENSE-MIT](LICENSE-MIT) or <http://opensource.org/licenses/MIT>)

at your option.
