use crate::*;
use godot::classes::Node;

pub trait NodeExt<T>
where
    T: Inherits<Node>,
{
    //todo
    // child_entered_tree
    // child_exiting_tree
    // child_order_changed

    /// Emitted when the node enters the tree.
    fn node_tree_entered(&self) -> SignalFuture<()>;
    /// Emitted after the node exits the tree and is no longer active.
    fn node_tree_exited(&self) -> SignalFuture<()>;
    /// Emitted when the node is just about to exit the tree. The node is still valid.
    /// As such, this is the right place for de-initialization (or a "destructor", if you will).
    fn node_tree_exiting(&self) -> SignalFuture<()>;
}

impl<T> NodeExt<T> for Gd<T>
where
    T: Inherits<Node>,
{
    #[inline]
    fn node_tree_entered(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "tree_entered").to_future::<()>()
    }

    #[inline]
    fn node_tree_exited(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "tree_exited").to_future::<()>()
    }

    #[inline]
    fn node_tree_exiting(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "tree_exiting").to_future::<()>()
    }
}
