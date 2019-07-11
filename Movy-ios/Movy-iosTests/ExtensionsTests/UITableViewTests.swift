//
//  UITableViewTests.swift
//  Movy-iosTests
//
//  Created by Fernando de la Fuente on 6/21/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import XCTest
@testable import Movy_ios

class UITableViewTests: XCTestCase {

    var rootWindow: UIWindow!
    var viewController: UITableViewController!
    let message = "Empty message"

    override func setUp() {
        super.setUp()

        viewController = UITableViewController()

        rootWindow = UIWindow(frame: UIScreen.main.bounds)
        rootWindow.isHidden = false
        rootWindow.rootViewController = viewController
        viewController.tableView.setEmptyMessage(message)
    }

    func testSetEmptyMessage() {
        XCTAssertNotNil(viewController.tableView.backgroundView, "Table view should have a backgroundview")

        guard let backgroundView = viewController.tableView.backgroundView as? UILabel else {
            XCTFail("Backgroundview should be a UILabel")
            return
        }

        XCTAssertEqual(backgroundView.text, message, "Empty message in view should be equal to given message")
        XCTAssertEqual(
            viewController.tableView.separatorStyle,
            UITableViewCell.SeparatorStyle.none,
            "SeparatorStyle should be none"
        )
    }

    func testRestore() {
        viewController.tableView.restore()

        XCTAssertNil(viewController.tableView.backgroundView, "Backgroundview should be nil")
        XCTAssertEqual(
            viewController.tableView.separatorStyle,
            UITableViewCell.SeparatorStyle.singleLine,
            "SeparatorStyle should be singleLine"
        )
    }
}
