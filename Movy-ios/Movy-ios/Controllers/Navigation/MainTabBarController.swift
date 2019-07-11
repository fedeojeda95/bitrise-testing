//
//  MainTabBarController.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/6/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    private let homeViewController = HomeViewController()
    private let searchViewController = SearchViewController()
    private let myListViewController = MyListViewController()
    private let profileViewController = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.accessibilityIdentifier = AccessibilityConstants.MainTabBar.mainTabBar
        tabBar.barTintColor = UIColor.movyBlack
        tabBar.tintColor = UIColor.movyMainSkyBlue
        tabBar.unselectedItemTintColor = UIColor.movyWhite

        viewControllers = [
            createController(title: "Home", imageName: "unsel_home_icon", viewController: homeViewController),
            createController(title: "Search", imageName: "unsel_search_icon", viewController: searchViewController),
            createController(title: "My List", imageName: "unsel_myList_icon", viewController: myListViewController),
            createController(title: "Profile", imageName: "unsel_profile_icon", viewController: profileViewController)
        ]
        removeTabbarItemsText()
    }

    private func createController(title: String, imageName: String, viewController: UIViewController)
        -> UINavigationController {
        let recentViewController = UINavigationController(rootViewController: viewController)
        recentViewController.tabBarItem.image = UIImage(named: imageName)
        recentViewController.tabBarItem.accessibilityIdentifier = "\(title)Tab"

        return recentViewController
    }

    private func removeTabbarItemsText() {
        var offset: CGFloat = 6.0

        if #available(iOS 11.0, *), traitCollection.horizontalSizeClass == .regular {
            offset = 0.0
        }

        if let items = tabBar.items {
            for item in items {
                item.title = ""
                item.imageInsets = UIEdgeInsets(top: offset, left: 0, bottom: -offset, right: 0)
            }
        }
    }
}
