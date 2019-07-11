//
//  MainTabBarTests.swift
//  Movy-iosUITests
//
//  Created by Fernando de la Fuente on 6/21/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import XCTest

class MainTabBarTests: XCTestCase {
    var app: XCUIApplication!
    let mainTabBarId = "MainTabBar"
    let tryNowButtonId = "TryNowButton"
    let homeViewId = "HomeView"
    let searchViewId = "SearchView"
    let myListViewId = "MyListView"
    let profileViewId = "ProfileView"
    let homeTabId = "HomeTab"
    let searchTabId = "SearchTab"
    let myListTabId = "My ListTab"
    let profileTabId = "ProfileTab"

    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        app.buttons[tryNowButtonId].tap()
    }

    func testTabBarItems() {
        XCTAssertTrue(app.tabBars[mainTabBarId].exists)
        XCTAssertTrue(app.tabBars[mainTabBarId].buttons[homeTabId].exists)
        XCTAssertTrue(app.tabBars[mainTabBarId].buttons[searchTabId].exists)
        XCTAssertTrue(app.tabBars[mainTabBarId].buttons[myListTabId].exists)
        XCTAssertTrue(app.tabBars[mainTabBarId].buttons[profileTabId].exists)

        app.tabBars[mainTabBarId].buttons[searchTabId].tap()
        XCTAssertTrue(app.otherElements[searchViewId].exists)

        app.tabBars[mainTabBarId].buttons[myListTabId].tap()
        XCTAssertTrue(app.otherElements[myListViewId].exists)

        app.tabBars[mainTabBarId].buttons[profileTabId].tap()
        XCTAssertTrue(app.otherElements[profileViewId].exists)

        app.tabBars[mainTabBarId].buttons[homeTabId].tap()
        XCTAssertTrue(app.otherElements[homeViewId].exists)
    }
}
