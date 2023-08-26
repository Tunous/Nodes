import Foundation

final class AppleDevices {
    let root = SimpleNode(value: "Apple")
    let desktops = SimpleNode(value: "Desktops")
    let macPro = SimpleNode(value: "Mac Pro")
    let macMini = SimpleNode(value: "Mac Mini")
    let iMac = SimpleNode(value: "iMac")
    let notebooks = SimpleNode(value: "Notebooks")
    let macBookPro = SimpleNode(value: "MacBook Pro")
    let devices = SimpleNode(value: "Devices")
    let handhelds = SimpleNode(value: "Handhelds")
    let ipod = SimpleNode(value: "iPod")
    let iphone = SimpleNode(value: "iPhone")
    let newton = SimpleNode(value: "Newton")
    let setTopBoxes = SimpleNode(value: "Set-top boxes")
    let appleTV = SimpleNode(value: "Apple TV")
    let ipodHiFi = SimpleNode(value: "iPod HiFi")

    init() {
        root.addChild(node: desktops)
        desktops.addChild(node: macPro)
        desktops.addChild(node: macMini)
        desktops.addChild(node: iMac)
        root.addChild(node: notebooks)
        notebooks.addChild(node: macBookPro)
        root.addChild(node: devices)
        devices.addChild(node: handhelds)
        handhelds.addChild(node: ipod)
        handhelds.addChild(node: iphone)
        handhelds.addChild(node: newton)
        devices.addChild(node: setTopBoxes)
        setTopBoxes.addChild(node: appleTV)
        devices.addChild(node: ipodHiFi)
    }
}
