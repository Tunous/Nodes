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
            assertionFailure("Parent doesn't contain this node as its child")
            return nil
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
            assertionFailure("Parent doesn't contain this node as its child")
            return nil
        }
        if selfIndex == 0 {
            return nil
        }
        return parent.children[selfIndex - 1]
    }
}
