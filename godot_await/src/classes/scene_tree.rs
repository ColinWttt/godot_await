use crate::{Gd, Inherits, Signal, SignalFuture};
use godot::{
    classes::{Node, SceneTree},
    task::FallibleSignalFuture,
};

pub trait SceneTreeExt<T> {
    /// Emitted when the `node` enters this tree.
    fn node_added(&self) -> SignalFuture<(Gd<Node>,)>;
    /// Emitted when the `node`'s Node.update_configuration_warnings() is called. Only emitted in the editor.
    fn node_configuration_warning_changed(&self) -> SignalFuture<(Gd<Node>,)>;
    /// Emitted when the `node` exits this tree.
    fn node_removed(&self) -> SignalFuture<(Gd<Node>,)>;
    /// Emitted when the `node`'s Node.name is changed.
    fn node_renamed(&self) -> SignalFuture<(Gd<Node>,)>;

    /// Emitted immediately before `Node._physics_process()` is called on every node in this tree.
    fn physics_frame(&self) -> SignalFuture<()>;
    /// Emitted immediately before `Node._process()` is called on every node in this tree.
    fn process_frame(&self) -> SignalFuture<()>;
    /// Emitted any time the tree's hierarchy changes (nodes being moved, renamed, etc.).
    fn tree_changed(&self) -> SignalFuture<()>;
    /// Emitted when the `Node.process_mode` of any node inside the tree is changed.
    /// Only emitted in the editor, to update the visibility of disabled nodes.
    fn tree_process_mode_changed(&self) -> SignalFuture<()>;

    /// Emitted when the `node` enters this tree.
    fn node_added_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)>;
    /// Emitted when the `node`'s Node.update_configuration_warnings() is called. Only emitted in the editor.
    fn node_configuration_warning_changed_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)>;
    /// Emitted when the `node` exits this tree.
    fn node_removed_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)>;
    /// Emitted when the `node`'s Node.name is changed.
    fn node_renamed_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)>;
    /// Emitted immediately before `Node._physics_process()` is called on every node in this tree.
    fn physics_frame_fallible(&self) -> FallibleSignalFuture<()>;
    /// Emitted immediately before `Node._process()` is called on every node in this tree.
    fn process_frame_fallible(&self) -> FallibleSignalFuture<()>;
    /// Emitted any time the tree's hierarchy changes (nodes being moved, renamed, etc.).
    fn tree_changed_fallible(&self) -> FallibleSignalFuture<()>;
    /// Emitted when the `Node.process_mode` of any node inside the tree is changed.
    /// Only emitted in the editor, to update the visibility of disabled nodes.
    fn tree_process_mode_changed_fallible(&self) -> FallibleSignalFuture<()>;
}

impl<T> SceneTreeExt<T> for Gd<T>
where
    T: Inherits<SceneTree>,
{
    #[inline]
    fn node_added(&self) -> SignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "node_added").to_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn node_configuration_warning_changed(&self) -> SignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "node_configuration_warning_changed")
            .to_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn node_removed(&self) -> SignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "node_removed").to_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn node_renamed(&self) -> SignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "node_renamed").to_future::<(Gd<Node>,)>()
    }

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
    #[inline]
    fn node_added_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "node_added").to_fallible_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn node_configuration_warning_changed_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "node_configuration_warning_changed")
            .to_fallible_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn node_removed_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "node_removed").to_fallible_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn node_renamed_fallible(&self) -> FallibleSignalFuture<(Gd<Node>,)> {
        Signal::from_object_signal(self, "node_renamed").to_fallible_future::<(Gd<Node>,)>()
    }
    #[inline]
    fn physics_frame_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "physics_frame").to_fallible_future::<()>()
    }
    #[inline]
    fn process_frame_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "process_frame").to_fallible_future::<()>()
    }
    #[inline]
    fn tree_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "tree_changed").to_fallible_future::<()>()
    }
    #[inline]
    fn tree_process_mode_changed_fallible(&self) -> FallibleSignalFuture<()> {
        Signal::from_object_signal(self, "tree_process_mode_changed").to_fallible_future::<()>()
    }
}
