//
//  NodeSearchTests.swift
//  
//
//  Created by Łukasz Rutkowski on 26/08/2023.
//

import XCTest

final class NodeSearchTests: BaseTestCase {

    func testBreadthFirstContains() {
        XCTAssertTrue(devices.root.contains(traversal: .breadthFirst, where: { $0 === devices.iphone }))
        XCTAssertTrue(devices.root.contains(traversal: .breadthFirst, where: { $0 === devices.root }))
        XCTAssertFalse(devices.devices.contains(traversal: .breadthFirst, where: { $0 === devices.root }))
        XCTAssertFalse(devices.devices.contains(traversal: .breadthFirst, where: { $0 === devices.iMac }))
    }

    func testDepthFirstContains() {
        XCTAssertTrue(devices.root.contains(traversal: .depthFirst, where: { $0 === devices.iphone }))
        XCTAssertTrue(devices.root.contains(traversal: .depthFirst, where: { $0 === devices.root }))
        XCTAssertFalse(devices.devices.contains(traversal: .depthFirst, where: { $0 === devices.root }))
        XCTAssertFalse(devices.devices.contains(traversal: .depthFirst, where: { $0 === devices.iMac }))
    }

    func testFirstBreadthFirstDescendant() {
        XCTAssertIdentical(devices.root.firstDescendant(traversal: .breadthFirst, where: { $0.value.contains("iPod") }), devices.ipodHiFi)
    }

    func testFirstDepthFirstDescendant() {
        XCTAssertIdentical(devices.root.firstDescendant(traversal: .depthFirst, where: { $0.value.contains("iPod") }), devices.ipod)
    }
}
