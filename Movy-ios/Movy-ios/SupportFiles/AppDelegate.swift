//
//  AppDelegate.swift
//  Movy-ios
//
//  Created by Fernando de la Fuente on 6/3/19.
//  Copyright © 2019 Fernando de la Fuente. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {

        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = LandingPageController()

        createMyListIfNotExists()
        return true
    }

    private func createMyListIfNotExists() {
        var myList = RealmManager().objects(MyList.self)?.filter {
            $0.userId == 0
        }.first

        guard myList == nil else { return }
        myList = MyList()
        RealmManager().add(myList!)
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {}
}
