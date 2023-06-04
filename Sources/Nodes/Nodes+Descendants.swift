import Foundation

public enum NodeTraversal {
    /// Traverse the graph using depth first algorithm.
    case depthFirst

    /// Traverse the graph using breadth first algorithm.
    case breadthFirst
}

extension Node {

    /// Returns all descendants, traversing the entire tree.
    public var descendants: [Self] {
        var nodes = [Self]()
        if isBranch {
            nodes.append(contentsOf: children)
            for child in children {
                nodes.append(contentsOf: child.descendants)
            }
        }
        return nodes
    }

    /// Returns all descendants using order from given `traversal`.
    ///
    /// - Parameter traversal: How to traverse to next descendant.
    public func descendants(traversal: NodeTraversal) -> some Sequence<Self> {
        return NodeDescendants(node: self, traversal: traversal)
    }
}

private struct NodeDescendants<Node: Nodes.Node>: Sequence {
    let node: Node
    let traversal: NodeTraversal

    func makeIterator() -> Iterator {
        Iterator(stack: node.children, traversal: traversal)
    }

    struct Iterator: IteratorProtocol {
        var stack: [Node]
        let traversal: NodeTraversal

        mutating func next() -> Node? {
            if stack.isEmpty { return nil }
            let node = stack.removeFirst()

            switch traversal {
            case .depthFirst:
                stack.insert(contentsOf: node.children, at: 0)
            case .breadthFirst:
                stack.append(contentsOf: node.children)
            }

            return node
        }
    }
}
