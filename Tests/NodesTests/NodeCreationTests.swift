//
//  NodeCreationTests.swift
//  
//
//  Created by Łukasz Rutkowski on 26/08/2023.
//

import XCTest

final class NodeCreationTests: BaseTestCase {

    func testNodeBuilder() {
        let root = SimpleNode("Apple") {
            SimpleNode("Desktops") {
                SimpleNode("Mac Pro")
                SimpleNode("Mac Mini")
                SimpleNode("iMac")
            }
            SimpleNode("Notebooks") {
                SimpleNode("MacBook Pro")
            }
            SimpleNode("Devices") {
                SimpleNode("Handhelds") {
                    SimpleNode("iPod")
                    SimpleNode("iPhone")
                    SimpleNode("Newton")
                }
                SimpleNode("Set-top boxes") {
                    SimpleNode("Apple TV")
                }
                SimpleNode("iPod HiFi")
            }
        }
        XCTAssertEqual(root, devices.root)
        XCTAssertEqual(root.children, [devices.desktops, devices.notebooks, devices.devices])
        XCTAssertEqual(root.children[0].children, [devices.macPro, devices.macMini, devices.iMac])
        XCTAssertEqual(root.children[0].children[0].children, [])
        XCTAssertEqual(root.children[0].children[1].children, [])
        XCTAssertEqual(root.children[0].children[2].children, [])
        XCTAssertEqual(root.children[1].children, [devices.macBookPro])
        XCTAssertEqual(root.children[1].children[0].children, [])
        XCTAssertEqual(root.children[2].children, [devices.handhelds, devices.setTopBoxes, devices.ipodHiFi])
        XCTAssertEqual(root.children[2].children[0].children, [devices.ipod, devices.iphone, devices.newton])
        XCTAssertEqual(root.children[2].children[0].children[0].children, [])
        XCTAssertEqual(root.children[2].children[0].children[1].children, [])
        XCTAssertEqual(root.children[2].children[0].children[2].children, [])
        XCTAssertEqual(root.children[2].children[1].children, [devices.appleTV])
        XCTAssertEqual(root.children[2].children[1].children[0].children, [])
        XCTAssertEqual(root.children[2].children[2].children, [])
    }
}
