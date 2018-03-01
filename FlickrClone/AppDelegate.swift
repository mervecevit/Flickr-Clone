//
//  AppDelegate.swift
//  FlickrClone
//
//  Created by Merve Ecevit on 1/03/18.
//  Copyright © 2018 Merve Ecevit. All rights reserved.
//

import UIKit
import SnapKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = TimelineViewController()
        return true
    }
}

