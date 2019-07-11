//
//  MMovyIosUITests.swift
//  MovyIosUITests
//
//  Created by Fernando de la Fuente on 6/21/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import XCTest
@testable import Movy_ios

class LandingPageTests: XCTestCase {
    var app: XCUIApplication!
    let landingPageId = "LandingPage"
    let tryNowButtonId = "TryNowButton"
    let mainTabBarId = "MainTabBar"
    let homeViewId = "HomeView"

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    func testAppDisplaysLandingPage() {
        app.launch()
        XCTAssertTrue(app.otherElements[landingPageId].exists)
    }

    func testTryNowButtonPresentMainTabControllerAndHome() {
        app.launch()
        XCTAssertTrue(app.buttons[tryNowButtonId].exists)

        app.buttons[tryNowButtonId].tap()
        XCTAssertTrue(app.tabBars[mainTabBarId].exists)
        XCTAssertTrue(app.otherElements[homeViewId].exists)
    }
}
