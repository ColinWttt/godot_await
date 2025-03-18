
# godot_await

A simple wrapper for awaiting Godot built-in signals in an async context.  
It only uses `godot`.

## Examples

### Wait for a Duration  

Using `godot_await`:

```rust
  wait(1.0).await;
```

Equivalent to:

GDScript

```php
  await get_tree().create_timer(1.0).timeout 
```

Rust

```rust  
  let timer = Engine::singleton().get_main_loop().unwrap().cast().unwrap().create_timer(1.0);
  Signal::from_object_signal(&timer, "timeout").to_future::<()>().await
```

### Wait for tween finished

Using `godot_await`:

```rust
  tween.finished().await;
```

Equivalent to

GDScript

```php
  await tween.finished
```

Rust

```rust
  let signal =  Signal::from_object_signal(self, "finished");
  signal.to_future::<()>().await;
```

## License

Licensed under either of

* Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or <http://www.apache.org/licenses/LICENSE-2.0>)
* MIT license ([LICENSE-MIT](LICENSE-MIT) or <http://opensource.org/licenses/MIT>)

at your option.
