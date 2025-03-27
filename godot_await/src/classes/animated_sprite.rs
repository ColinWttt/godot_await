use crate::{FallibleSignalFuture, Gd, Inherits, Signal, SignalFuture};
use godot::classes::{AnimatedSprite2D, AnimatedSprite3D, Node};

trait AnimatedSpriteSignal: Inherits<Node> {}

impl AnimatedSpriteSignal for AnimatedSprite2D {}
impl AnimatedSpriteSignal for AnimatedSprite3D {}

pub trait AnimatedSpriteExt<T>
where
    T: Inherits<Node>,
{
    /// Emitted when `animation` changes.
    fn animation_changed(&self) -> SignalFuture<()>;
    /// Emitted when the animation reaches the end, or the start if it is played in reverse.
    /// When the animation finishes, it pauses the playback.  
    /// Note: This signal is not emitted if an animation is looping.
    fn animation_finished(&self) -> SignalFuture<()>;
    /// Emitted when the animation loops.
    fn animation_looped(&self) -> SignalFuture<()>;
    /// Emitted when frame changes.
    fn frame_changed(&self) -> SignalFuture<()>;
    /// Emitted when `sprite_frames` changes.
    fn sprite_frames_changed(&self) -> SignalFuture<()>;

    fn animation_changed_fallible(&self) -> FallibleSignalFuture<()>;
    fn animation_finished_fallible(&self) -> FallibleSignalFuture<()>;
    fn animation_looped_fallible(&self) -> FallibleSignalFuture<()>;
    fn frame_changed_fallible(&self) -> FallibleSignalFuture<()>;
    fn sprite_frames_changed_fallible(&self) -> FallibleSignalFuture<()>;
}

impl<T> AnimatedSpriteExt<T> for Gd<T>
where
    T: AnimatedSpriteSignal,
{
    #[inline]
    fn animation_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "animation_changed").to_future::<()>()
    }
    #[inline]
    fn animation_finished(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "animation_finished").to_future::<()>()
    }
    #[inline]
    fn animation_looped(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "animation_looped").to_future::<()>()
    }
    #[inline]
    fn frame_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "frame_changed").to_future::<()>()
    }
    #[inline]
    fn sprite_frames_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "sprite_frames_changed").to_future::<()>()
    }
    #[inline]
    fn animation_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "animation_changed").to_fallible_future::<()>()
    }
    #[inline]
    fn animation_finished_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "animation_finished").to_fallible_future::<()>()
    }
    #[inline]
    fn animation_looped_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "animation_looped").to_fallible_future::<()>()
    }
    #[inline]
    fn frame_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "frame_changed").to_fallible_future::<()>()
    }
    #[inline]
    fn sprite_frames_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "sprite_frames_changed").to_fallible_future::<()>()
    }
}
