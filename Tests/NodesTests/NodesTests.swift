import XCTest
@testable import Nodes

final class NodesTests: XCTestCase {
    var root: SimpleNode!
    var desktops: SimpleNode!
    var macPro: SimpleNode!
    var macMini: SimpleNode!
    var iMac: SimpleNode!
    var notebooks: SimpleNode!
    var macBookPro: SimpleNode!
    var devices: SimpleNode!
    var handhelds: SimpleNode!
    var ipod: SimpleNode!
    var iphone: SimpleNode!
    var newton: SimpleNode!
    var setTopBoxes: SimpleNode!
    var appleTV: SimpleNode!
    var ipodHiFi: SimpleNode!

    override func setUp() {
        root = SimpleNode(value: "Apple")

        desktops = SimpleNode(value: "Desktops")
        root.addChild(node: desktops)

        macPro = SimpleNode(value: "Mac Pro")
        desktops.addChild(node: macPro)

        macMini = SimpleNode(value: "Mac Mini")
        desktops.addChild(node: macMini)

        iMac = SimpleNode(value: "iMac")
        desktops.addChild(node: iMac)

        notebooks = SimpleNode(value: "Notebooks")
        root.addChild(node: notebooks)

        macBookPro = SimpleNode(value: "MacBook Pro")
        notebooks.addChild(node: macBookPro)

        devices = SimpleNode(value: "Devices")
        root.addChild(node: devices)

        handhelds = SimpleNode(value: "Handhelds")
        devices.addChild(node: handhelds)

        ipod = SimpleNode(value: "iPod")
        handhelds.addChild(node: ipod)

        iphone = SimpleNode(value: "iPhone")
        handhelds.addChild(node: iphone)

        newton = SimpleNode(value: "Newton")
        handhelds.addChild(node: newton)

        setTopBoxes = SimpleNode(value: "Set-top boxes")
        devices.addChild(node: setTopBoxes)

        appleTV = SimpleNode(value: "Apple TV")
        setTopBoxes.addChild(node: appleTV)

        ipodHiFi = SimpleNode(value: "iPod HiFi")
        devices.addChild(node: ipodHiFi)
    }

    func testTree() {
        XCTAssertEqual(ipod.siblings, [iphone, newton])
        XCTAssertEqual(ipod.siblingsIncludingSelf, [ipod, iphone, newton])
        XCTAssertEqual(root.siblingsIncludingSelf, [])
        XCTAssertEqual(appleTV.ancestors, [setTopBoxes, devices, root])
        XCTAssertEqual(iphone.ancestorsIncludingSelf, [iphone, handhelds, devices, root])
        XCTAssertTrue(newton.isLeaf)
        XCTAssertEqual(devices.leaves, [ipodHiFi])
        XCTAssertEqual(devices.breadth, 1)
        XCTAssertTrue(devices.isBranch)
        XCTAssertEqual(devices.branches, [handhelds, setTopBoxes])
        XCTAssertFalse(macBookPro.isBranch)
        XCTAssertEqual(root.depth, 0)
        XCTAssertEqual(root.level, 1)
        XCTAssertEqual(appleTV.depth, 3)
        XCTAssertEqual(appleTV.level, 4)
        XCTAssertTrue(root.isRoot)
        XCTAssertFalse(newton.isRoot)
        XCTAssertEqual(newton.root, root)
        XCTAssertEqual(root.root, root)
        XCTAssertEqual(root.degree, 3)
        XCTAssertEqual(root.descendants.sorted { $0.value < $1.value }, [desktops!, macPro!, macMini!, iMac!, notebooks!, macBookPro!, devices!, handhelds!, ipod!, iphone!, newton!, setTopBoxes!, appleTV!, ipodHiFi!].sorted { $0.value < $1.value })
        XCTAssertEqual(ipodHiFi.description, "iPod HiFi")
        
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
        
        XCTAssertEqual(root.lineBasedDescription, treeRepresentation)
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
        XCTAssertEqual(root, self.root)
        XCTAssertEqual(root.children, [desktops, notebooks, devices])
        XCTAssertEqual(root.children[0].children, [macPro, macMini, iMac])
        XCTAssertEqual(root.children[0].children[0].children, [])
        XCTAssertEqual(root.children[0].children[1].children, [])
        XCTAssertEqual(root.children[0].children[2].children, [])
        XCTAssertEqual(root.children[1].children, [macBookPro])
        XCTAssertEqual(root.children[1].children[0].children, [])
        XCTAssertEqual(root.children[2].children, [handhelds, setTopBoxes, ipodHiFi])
        XCTAssertEqual(root.children[2].children[0].children, [ipod, iphone, newton])
        XCTAssertEqual(root.children[2].children[0].children[0].children, [])
        XCTAssertEqual(root.children[2].children[0].children[1].children, [])
        XCTAssertEqual(root.children[2].children[0].children[2].children, [])
        XCTAssertEqual(root.children[2].children[1].children, [appleTV])
        XCTAssertEqual(root.children[2].children[1].children[0].children, [])
        XCTAssertEqual(root.children[2].children[2].children, [])
    }

    static var allTests = [
        ("testTree", testTree),
        ("testNodeBuilder", testNodeBuilder),
    ]
}
