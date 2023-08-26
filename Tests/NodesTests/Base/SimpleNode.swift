//
//  File.swift
//  
//
//  Created by Devran on 01.11.19.
//

@testable import Nodes

final class SimpleNode: Node {
    let value: String
    weak var parent: SimpleNode?
    var children: [SimpleNode]

    init(value: String) {
        self.value = value
        self.children = []
    }
}

extension SimpleNode: Equatable {
    static func == (lhs: SimpleNode, rhs: SimpleNode) -> Bool {
        return lhs.value == rhs.value && lhs.parent == rhs.parent
    }
}

extension SimpleNode: CustomStringConvertible {
    public var description: String {
        return "\(value)"
    }
}
