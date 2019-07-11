//
//  ArrayTests.swift
//  Movy-iosTests
//
//  Created by Fernando de la Fuente on 6/21/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import XCTest
@testable import Movy_ios

class ArrayTests: XCTestCase {

    let arrayTest: [String] = ["Testing", "Array"]

    func testValidItem() {
        let item = arrayTest.item(at: 0)
        guard item != nil else {
            XCTFail("Error, item shouldn't be nil")
            return
        }
    }

    func testInvalidItem() {
        let item = arrayTest.item(at: 4)
        guard item == nil else {
            XCTFail("Error, item should be nil")
            return
        }
    }
}
