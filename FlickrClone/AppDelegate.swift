//
//  AppDelegate.swift
//  FlickrClone
//
//  Created by Merve Ecevit on 1/03/18.
//  Copyright © 2018 Merve Ecevit. All rights reserved.
//

import UIKit
import SnapKit

let baseUrl = "https://api.flickr.com/services/rest/?method="
let flickrMethod = "flickr.photos.getRecent"
let apiKey = "44dc856638867f5d04dd0450b9b1f9cf"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: TimelineViewController())
        window?.rootViewController = navigationController
        return true
    }
}

