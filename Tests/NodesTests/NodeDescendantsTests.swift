//
//  NodeDescendantsTests.swift
//  
//
//  Created by Łukasz Rutkowski on 26/08/2023.
//

import XCTest

final class NodeDescendantsTests: BaseTestCase {

    func testDescendants() {
        XCTAssertEqual(devices.root.descendants, [
            devices.desktops, devices.notebooks, devices.devices,
            devices.macPro, devices.macMini, devices.iMac,
            devices.macBookPro,
            devices.handhelds, devices.setTopBoxes, devices.ipodHiFi,
            devices.ipod, devices.iphone, devices.newton,
            devices.appleTV
        ])
    }

    func testDescendantsIncludingSelf() {
        XCTAssertEqual(devices.root.descendantsIncludingSelf, [
            devices.root,
            devices.desktops, devices.notebooks, devices.devices,
            devices.macPro, devices.macMini, devices.iMac,
            devices.macBookPro,
            devices.handhelds, devices.setTopBoxes, devices.ipodHiFi,
            devices.ipod, devices.iphone, devices.newton,
            devices.appleTV
        ])
    }

    func testBreadthFirstDescendants() {
        let descendants = Array(devices.root.descendants(traversal: .breadthFirst))
        XCTAssertEqual(descendants, [
            devices.desktops, devices.notebooks, devices.devices,
            devices.macPro, devices.macMini, devices.iMac,
            devices.macBookPro,
            devices.handhelds, devices.setTopBoxes, devices.ipodHiFi,
            devices.ipod, devices.iphone, devices.newton,
            devices.appleTV
        ])
    }

    func testDepthFirstDescendants() {
        let descendants = devices.root.descendants(traversal: .depthFirst)
        XCTAssertEqual(Array(descendants), [
            devices.desktops, devices.macPro, devices.macMini, devices.iMac,
            devices.notebooks, devices.macBookPro,
            devices.devices, devices.handhelds, devices.ipod, devices.iphone, devices.newton,
            devices.setTopBoxes, devices.appleTV,
            devices.ipodHiFi
        ])
    }

    func testBreadthFirstDescendantsIncludingSelf() {
        let descendants = Array(devices.root.descendantsIncludingSelf(traversal: .breadthFirst))
        XCTAssertEqual(descendants, [
            devices.root,
            devices.desktops, devices.notebooks, devices.devices,
            devices.macPro, devices.macMini, devices.iMac,
            devices.macBookPro,
            devices.handhelds, devices.setTopBoxes, devices.ipodHiFi,
            devices.ipod, devices.iphone, devices.newton,
            devices.appleTV
        ])
    }

    func testDepthFirstDescendantsIncludingSelf() {
        let descendants = devices.root.descendantsIncludingSelf(traversal: .depthFirst)
        XCTAssertEqual(Array(descendants), [
            devices.root,
            devices.desktops, devices.macPro, devices.macMini, devices.iMac,
            devices.notebooks, devices.macBookPro,
            devices.devices, devices.handhelds, devices.ipod, devices.iphone, devices.newton,
            devices.setTopBoxes, devices.appleTV,
            devices.ipodHiFi
        ])
    }
}
