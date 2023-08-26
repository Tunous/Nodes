//
//  NodeSiblingsTests.swift
//  
//
//  Created by Łukasz Rutkowski on 26/08/2023.
//

import XCTest

final class NodeSiblingsTests: BaseTestCase {

    func testSiblings() {
        XCTAssertEqual(devices.ipod.siblings, [devices.iphone, devices.newton])
        XCTAssertEqual(devices.root.siblings, [])
    }

    func testSiblingsIncludingSelf() {
        XCTAssertEqual(devices.ipod.siblingsIncludingSelf, [devices.ipod, devices.iphone, devices.newton])
        XCTAssertEqual(devices.root.siblingsIncludingSelf, [])
    }

    func testNextSibling() {
        XCTAssertNil(devices.root.nextSibling)
        XCTAssertNil(devices.iMac.nextSibling)
        XCTAssertIdentical(devices.desktops.nextSibling, devices.notebooks)
        XCTAssertIdentical(devices.iphone.nextSibling, devices.newton)
    }

    func testPreviousSibling() {
        XCTAssertNil(devices.root.previousSibling)
        XCTAssertNil(devices.desktops.previousSibling)
        XCTAssertNil(devices.ipod.previousSibling)
        XCTAssertIdentical(devices.devices.previousSibling, devices.notebooks)
        XCTAssertIdentical(devices.iphone.previousSibling, devices.ipod)
    }

    func testHasNextSibling() {
        XCTAssertFalse(devices.root.hasNextSibling)
        XCTAssertTrue(devices.desktops.hasNextSibling)
        XCTAssertTrue(devices.notebooks.hasNextSibling)
        XCTAssertFalse(devices.devices.hasNextSibling)
    }
}
