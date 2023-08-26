import XCTest
@testable import Nodes

final class NodesTests: XCTestCase {

    var devices = AppleDevices()

    override func setUp() {
        devices = AppleDevices()
    }

    func testTree() {
        XCTAssertEqual(devices.ipod.siblings, [devices.iphone, devices.newton])
        XCTAssertEqual(devices.ipod.siblingsIncludingSelf, [devices.ipod, devices.iphone, devices.newton])
        XCTAssertEqual(devices.root.siblingsIncludingSelf, [])
        XCTAssertEqual(devices.appleTV.ancestors, [devices.setTopBoxes, devices.devices, devices.root])
        XCTAssertEqual(devices.iphone.ancestorsIncludingSelf, [devices.iphone, devices.handhelds, devices.devices, devices.root])
        XCTAssertTrue(devices.newton.isLeaf)
        XCTAssertEqual(devices.devices.leaves, [devices.ipodHiFi])
        XCTAssertEqual(devices.devices.breadth, 1)
        XCTAssertTrue(devices.devices.isBranch)
        XCTAssertEqual(devices.devices.branches, [devices.handhelds, devices.setTopBoxes])
        XCTAssertFalse(devices.macBookPro.isBranch)
        XCTAssertEqual(devices.root.depth, 0)
        XCTAssertEqual(devices.root.level, 1)
        XCTAssertEqual(devices.appleTV.depth, 3)
        XCTAssertEqual(devices.appleTV.level, 4)
        XCTAssertTrue(devices.root.isRoot)
        XCTAssertFalse(devices.newton.isRoot)
        XCTAssertEqual(devices.newton.root, devices.root)
        XCTAssertEqual(devices.root.root, devices.root)
        XCTAssertEqual(devices.root.degree, 3)
        XCTAssertEqual(devices.root.descendants.sorted { $0.value < $1.value }, [devices.desktops, devices.macPro, devices.macMini, devices.iMac, devices.notebooks, devices.macBookPro, devices.devices, devices.handhelds, devices.ipod, devices.iphone, devices.newton, devices.setTopBoxes, devices.appleTV, devices.ipodHiFi].sorted { $0.value < $1.value })
        XCTAssertEqual(devices.ipodHiFi.description, "iPod HiFi")

        let treeRepresentation = """
        Apple
        ├── Desktops
        │   ├── Mac Pro
        │   ├── Mac Mini
        │   └── iMac
        ├── Notebooks
        │   └── MacBook Pro
        └── Devices
            ├── Handhelds
            │   ├── iPod
            │   ├── iPhone
            │   └── Newton
            ├── Set-top boxes
            │   └── Apple TV
            └── iPod HiFi

        """
        
        XCTAssertEqual(devices.root.lineBasedDescription, treeRepresentation)
    }

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

    func testBreadthFirstDescendants() {
        let descendants = Array(devices.root.descendants(traversal: .breadthFirst))
        XCTAssertEqual(descendants, [devices.desktops, devices.notebooks, devices.devices, devices.macPro, devices.macMini, devices.iMac, devices.macBookPro, devices.handhelds, devices.setTopBoxes, devices.ipodHiFi, devices.ipod, devices.iphone, devices.newton, devices.appleTV])
    }

    func testDepthFirstDescendants() {
        let descendants = devices.root.descendants(traversal: .depthFirst)
        XCTAssertEqual(Array(descendants), [devices.desktops, devices.macPro, devices.macMini, devices.iMac, devices.notebooks, devices.macBookPro, devices.devices, devices.handhelds, devices.ipod, devices.iphone, devices.newton, devices.setTopBoxes, devices.appleTV, devices.ipodHiFi])
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
}
