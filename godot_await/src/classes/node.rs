use crate::{FallibleSignalFuture, Gd, Inherits, Signal, SignalFuture};
use godot::classes::{Node, Node3D};

pub trait NodeExt<T>
where
    T: Inherits<Node>,
{
    /// Emitted when the child node enters the `SceneTree`,
    /// usually because this node entered the tree (see `tree_entered`), or `add_child()` has been called.
    ///
    /// This signal is emitted after the child node's own `NOTIFICATION_ENTER_TREE` and `tree_entered`.
    fn child_entered_tree(&self) -> SignalFuture<(Gd<Node>,)>;
    /// Emitted when the child node is about to exit the SceneTree,
    /// usually because this node is exiting the tree (see tree_exiting),
    /// or because the child node is being removed or freed.
    ///
    /// When this signal is received, the child node is still accessible inside the tree.
    /// This signal is emitted after the child node's own `tree_exiting` and `NOTIFICATION_EXIT_TREE`.
    fn child_exiting_tree(&self) -> SignalFuture<(Gd<Node>,)>;
    /// Emitted when the list of children is changed.
    /// This happens when child nodes are added, moved or removed.
    fn child_order_changed(&self) -> SignalFuture<()>;
    /// Emitted when the node's editor description field changed.
    fn editor_description_changed(&self) -> SignalFuture<(Gd<Node>,)>;
    /// Emitted when an attribute of the node that is relevant to the editor is changed.
    /// Only emitted in the editor.
    fn editor_state_changed(&self) -> SignalFuture<()>;
    /// Emitted when the node is considered ready, after _ready() is called.
    fn ready(&self) -> SignalFuture<()>;
    /// Emitted when the node's name is changed, if the node is inside the tree.
    fn renamed(&self) -> SignalFuture<(Gd<Node>,)>;
    ///Emitted when this node is being replaced by the node, see `replace_by()`.
    ///
    ///This signal is emitted after node has been added as a child of the original parent node, but before all original child nodes have been reparented to node.
    fn replacing_by(&self) -> SignalFuture<()>;
    /// Emitted when the node enters the tree.
    fn tree_entered(&self) -> SignalFuture<()>;
    /// Emitted after the node exits the tree and is no longer active.
    fn tree_exited(&self) -> SignalFuture<()>;
    /// Emitted when the node is just about to exit the tree. The node is still valid.
    /// As such, this is the right place for de-initialization (or a "destructor", if you will).
    ///
    /// This signal is emitted after the node's `_exit_tree()`, and before the related `NOTIFICATION_EXIT_TREE`.
    fn tree_exiting(&self) -> SignalFuture<()>;

    fn child_entered_tree_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)>;
    fn child_exiting_tree_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)>;
    fn child_order_changed_fallible(&self) -> FallibleSignalFuture<()>;
    fn editor_description_changed_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)>;
    fn editor_state_changed_fallible(&self) -> FallibleSignalFuture<()>;
    fn ready_fallible(&self) -> FallibleSignalFuture<()>;
    fn renamed_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)>;
    fn replacing_by_fallible(&self) -> FallibleSignalFuture<()>;
    fn tree_entered_fallible(&self) -> FallibleSignalFuture<()>;
    fn tree_exited_fallible(&self) -> FallibleSignalFuture<()>;
}

impl<T> NodeExt<T> for Gd<T>
where
    T: Inherits<Node>,
{
    #[inline]
    fn child_entered_tree(&self) -> SignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "child_entered_tree").to_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn child_exiting_tree(&self) -> SignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "child_exiting_tree").to_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn child_order_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "child_order_changed").to_future::<()>()
    }
    #[inline]
    fn editor_description_changed(&self) -> SignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "editor_description_changed").to_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn editor_state_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "editor_state_changed").to_future::<()>()
    }
    #[inline]
    fn ready(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "ready").to_future::<()>()
    }
    #[inline]
    fn renamed(&self) -> SignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "renamed").to_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn replacing_by(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "replacing_by").to_future::<()>()
    }
    #[inline]
    fn tree_entered(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "tree_entered").to_future::<()>()
    }

    #[inline]
    fn tree_exited(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "tree_exited").to_future::<()>()
    }

    #[inline]
    fn tree_exiting(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "tree_exiting").to_future::<()>()
    }
    #[inline]
    fn child_entered_tree_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "child_entered_tree").to_fallible_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn child_exiting_tree_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "child_exiting_tree").to_fallible_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn child_order_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "child_order_changed").to_fallible_future::<()>()
    }
    #[inline]
    fn editor_description_changed_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "editor_description_changed")
            .to_fallible_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn editor_state_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "editor_state_changed").to_fallible_future::<()>()
    }
    #[inline]
    fn ready_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "ready").to_fallible_future::<()>()
    }
    #[inline]
    fn renamed_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "renamed").to_fallible_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn replacing_by_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "replacing_by").to_fallible_future::<()>()
    }
    #[inline]
    fn tree_entered_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "tree_entered").to_fallible_future::<()>()
    }
    #[inline]
    fn tree_exited_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "tree_exited").to_fallible_future::<()>()
    }
}

pub trait Node3DExt<T>
where
    T: Inherits<Node3D>,
{
    /// Emitted when node visibility changes.
    fn visibility_changed(&self) -> SignalFuture<()>;
    fn visibility_changed_fallible(&self) -> FallibleSignalFuture<()>;
}

impl<T> Node3DExt<T> for Gd<T>
where
    T: Inherits<Node3D>,
{
    #[inline]
    fn visibility_changed(&self) -> SignalFuture<()> {
        Signal::from_object_signal(self, "visibility_changed").to_future::<()>()
    }
    #[inline]
    fn visibility_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "visibility_changed").to_fallible_future::<()>()
    }
}
