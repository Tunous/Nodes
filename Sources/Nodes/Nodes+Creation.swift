import Foundation

extension Node {
    public init(_ value: Value) {
        self.init(value: value)
    }

    public init(_ value: Value, children: [Self]) {
        self.init(value: value)
        for child in children {
            self.addChild(node: child)
        }
    }

    public init(_ value: Value, @NodeBuilder children: () -> [Self]) {
        self.init(value, children: children())
    }
}

@resultBuilder
public struct NodeBuilder {
    public static func buildBlock<Node: Nodes.Node>(_ components: Node...) -> [Node] {
        return components
    }
}
