import XCTest
@testable import Nodes

final class NodesTests: BaseTestCase {

    func testTree() {
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
}
