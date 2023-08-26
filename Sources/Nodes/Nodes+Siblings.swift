import Foundation

extension Node {

    /// Returns all other nodes with the same parent.
    public var siblings: [Self] {
        return siblingsIncludingSelf.filter { $0 !== self }
    }

    /// Returns all nodes (including the current node) with the same parent.
    public var siblingsIncludingSelf: [Self] {
        return parent?.children ?? []
    }

    /// Returns node that is placed directly after this node in children array of its parent.
    public var nextSibling: Self? {
        guard let parent else { return nil }
        guard let selfIndex = parent.children.firstIndex(where: { $0 === self }) else {
            preconditionFailure("Parent doesn't contain this node as its child")
        }
        if parent.children.count == selfIndex + 1 {
            return nil
        }
        return parent.children[selfIndex + 1]
    }

    /// Returns node that is placed directly before this node in children array of its parent.
    public var previousSibling: Self? {
        guard let parent else { return nil }
        guard let selfIndex = parent.children.firstIndex(where: { $0 === self }) else {
            preconditionFailure("Parent doesn't contain this node as its child")
        }
        if selfIndex == 0 {
            return nil
        }
        return parent.children[selfIndex - 1]
    }

    /// Returns a Boolean value indicating whether the parent has a child node directly after this node.
    public var hasNextSibling: Bool {
        nextSibling != nil
    }
}
