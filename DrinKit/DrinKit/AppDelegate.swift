//
//  AppDelegate.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 19..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont.tabbarText], for: .normal)
        return true
    }

}

