//
//  BaseTestCase.swift
//  
//
//  Created by Łukasz Rutkowski on 26/08/2023.
//

import XCTest

class BaseTestCase: XCTestCase {
    private(set) var devices = AppleDevices()

    override func setUp() {
        devices = AppleDevices()
    }
}
