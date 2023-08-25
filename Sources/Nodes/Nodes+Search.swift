import Foundation

extension Node {

    /// Returns a Boolean value indicating whether the node graph contains a
    /// node that satisfies the given predicate.
    /// 
    /// - Parameter predicate: A closure that takes a node from the graph
    ///   as its argument and returns a Boolean value that indicates whether
    ///   the passed node represents a match.
    /// - Parameter traversal: How to traverse to next node.
    /// - Returns: `true` if the node graph contains an element that satisfies
    ///   `predicate`; otherwise, `false`.
    public func contains(traversal: NodeTraversal, where predicate: (Self) -> Bool) -> Bool {
        return descendantsIncludingSelf(traversal: traversal)
            .contains(where: predicate)
    }

    /// Returns the first descendant of the node that satisfies the given
    /// predicate.
    ///
    /// - Parameter predicate: A closure that takes a node of the node  as
    ///   its argument and returns a Boolean value indicating whether the
    ///   node is a match.
    /// - Parameter traversal: How to traverse to next node.
    /// - Returns: The first descendant of the node that satisfies `predicate`,
    ///   or `nil` if there is no element that satisfies `predicate`.
    public func firstDescendant(traversal: NodeTraversal, where predicate: (Self) -> Bool) -> Self? {
        return descendants(traversal: traversal)
            .first(where: predicate)
    }
}
