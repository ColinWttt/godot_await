use godot::classes::SceneTree;
use godot::classes::scene_tree::ExCreateTimer;

use crate::utils::godot_tree;
use crate::*;

/// Builder for creating configurable wait timers
pub struct ExWaitBuilder<'a>(ExCreateTimer<'a>);

impl ExWaitBuilder<'_> {
    /// Set whether the timer should ignore the time scale
    ///
    /// # Arguments
    /// * `ignore_time_scale` - If true, the timer will ignore `Engine.time_scale` and update with the real, elapsed time.
    pub fn ignore_time_scale(self, ignore_time_scale: bool) -> Self {
        ExWaitBuilder(self.0.ignore_time_scale(ignore_time_scale))
    }
    /// Set whether the timer should always process
    ///
    /// # Arguments
    /// * `process_always` - If is false, the timer will be paused when setting paused to true.
    pub fn process_always(self, process_always: bool) -> Self {
        ExWaitBuilder(self.0.process_always(process_always))
    }

    /// Set whether the timer should process in physics
    ///
    /// # Arguments
    /// * `process_in_physics` - If true, the timer will update at the end of the physics frame, instead of the process frame.
    pub fn process_in_physics(self, process_in_physics: bool) -> Self {
        ExWaitBuilder(self.0.process_in_physics(process_in_physics))
    }

    /// Finalize the timer
    ///
    /// # Returns
    /// A future that will resolve when the timer times out
    #[inline]
    pub fn done(self) -> SignalFuture<()> {
        let timer = self.0.done().unwrap();
        Signal::from_object_signal(&timer, "timeout").to_future::<()>()
    }
}

/// Create a configurable wait timer
///
/// # Arguments
/// * `tree` - The scene tree to create the timer in
/// * `time_sec` - The time in seconds to wait
///
/// # Returns
/// A builder for configuring the wait timer
/// # Examples
/// ```rust
/// //in async
/// wait_ex(3.0).ignore_time_scale(true).done().await
/// ```
#[inline]
pub fn wait_ex(tree: &mut SceneTree, time_sec: f64) -> ExWaitBuilder<'_> {
    let timer = tree.create_timer_ex(time_sec);
    ExWaitBuilder(timer)
}

/// Wait for a specified amount of time.  
///
/// ```
/// //similar to GDScript
/// get_tree().create_timer(1.0).timeout
/// ```
/// # Arguments
/// * `time_sec` - The time in seconds to wait
///
/// # Returns
/// A future that will resolve when the wait is complete
///
/// # Examples
/// ```rust
/// //in async
/// wait(3.0).await
/// ```
#[inline]
pub fn wait(time_sec: f64) -> SignalFuture<()> {
    wait_ex(&mut godot_tree(), time_sec).done()
}
