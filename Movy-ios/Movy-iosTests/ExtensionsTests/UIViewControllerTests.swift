//
//  UIViewControllerTests.swift
//  Movy-iosTests
//
//  Created by Fernando de la Fuente on 6/21/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import XCTest
@testable import Movy_ios

class UIViewControllerTests: XCTestCase {

    var rootWindow: UIWindow!
    var viewControllerUnderTest: UIViewController!

    override func setUp() {
        super.setUp()

        viewControllerUnderTest = UIViewController()

        rootWindow = UIWindow(frame: UIScreen.main.bounds)
        rootWindow.isHidden = false
        rootWindow.rootViewController = viewControllerUnderTest
    }

    func testShowErrorIsPresentedWithGivenTitleAndDescription() {
        let title = "Test"
        let description = "Description"

        viewControllerUnderTest.showError(title: title, description: description)
        let alertController = viewControllerUnderTest.presentedViewController

        XCTAssertNotNil(alertController, "AlertController was not presented")

        guard let uiAlert = alertController as? UIAlertController else {
            XCTFail("Presented viewcontroller is not an UIAlertController")
            return
        }

        XCTAssertEqual(title, uiAlert.title)
        XCTAssertEqual(description, uiAlert.message)
    }
}
