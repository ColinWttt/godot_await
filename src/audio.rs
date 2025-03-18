use crate::*;
use godot::classes::{AudioStreamPlayer, AudioStreamPlayer2D, AudioStreamPlayer3D, Node};

trait AudioStreamPlayerSignal: Inherits<Node> {}

impl AudioStreamPlayerSignal for AudioStreamPlayer {}
impl AudioStreamPlayerSignal for AudioStreamPlayer2D {}
impl AudioStreamPlayerSignal for AudioStreamPlayer3D {}

pub trait AudioStreamPlayerExt<T>
where
    T: Inherits<Node>,
{
    /// Emitted when the audio stops playing.
    fn finished(&self) -> SignalFuture<()>;
}

impl<T> AudioStreamPlayerExt<T> for Gd<T>
where
    T: AudioStreamPlayerSignal,
{
    #[inline]
    fn finished(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "finished").to_future::<()>()
    }
}
