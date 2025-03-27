use crate::{Gd, Inherits, Signal, SignalFuture};
use godot::classes::SceneTree;

pub trait SceneTreeExt<T> {
    //toodo
    // node_added
    //node_configuration_warning_changed
    //node_removed
    //node_renamed

    /// Emitted immediately before `Node._physics_process()` is called on every node in this tree.
    fn physics_frame(&self) -> SignalFuture<()>;
    /// Emitted immediately before `Node._process()` is called on every node in this tree.
    fn process_frame(&self) -> SignalFuture<()>;
    /// Emitted any time the tree's hierarchy changes (nodes being moved, renamed, etc.).
    fn tree_changed(&self) -> SignalFuture<()>;
    /// Emitted when the `Node.process_mode` of any node inside the tree is changed.
    /// Only emitted in the editor, to update the visibility of disabled nodes.
    fn tree_process_mode_changed(&self) -> SignalFuture<()>;
}

impl<T> SceneTreeExt<T> for Gd<T>
where
    T: Inherits<SceneTree>,
{
    #[inline]
    fn physics_frame(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "physics_frame").to_future::<()>()
    }
    #[inline]
    fn process_frame(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "process_frame").to_future::<()>()
    }
    #[inline]
    fn tree_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "tree_changed").to_future::<()>()
    }
    #[inline]
    fn tree_process_mode_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "tree_process_mode_changed").to_future::<()>()
    }
}
