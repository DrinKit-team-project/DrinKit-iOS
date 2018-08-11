//
//  AppDelegate.swift
//  DrinKit
//
//  Created by 권재욱 on 2018. 7. 19..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, LoginFlowHandler {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
//        window = UIWindow.init(frame: UIScreen.main.bounds)
//        initialiseServices()
//        handleLogin(withWindow: window)
        
//        setTabbarFont()
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions) || true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        KOSession.handleDidBecomeActive()
    }
    
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url) {
            return KOSession.handleOpen(url)
        }
        let facebookSession = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
        return facebookSession
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if KOSession.isKakaoAccountLoginCallback(url) {
            return KOSession.handleOpen(url)
        }
        let facebookSession = FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        return facebookSession
    }
    
    private func setTabbarFont() {
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont.tabbarText], for: .normal)
    }
    
}

// MARK: - LoginFlowHandler

enum AppStoryboard: String {
    
    case main = "Main"
    case account = "Account"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
}

protocol LoginFlowHandler {
    
    func handleLogin(withWindow window: UIWindow?)
    func handleLogout(withWindow window: UIWindow?)
    
}

extension LoginFlowHandler {
    
    func handleLogin(withWindow window: UIWindow?) {
        
//        if let _ = AppState.shared.currentUserId {
//            //User has logged in before, cache and continue
//            self.showMainApp(withWindow: window)
//        } else {
//            //No user information, show login flow
//            self.showLogin(withWindow: window)
//        }
    }
    
    func handleLogout(withWindow window: UIWindow?) {
//        AppState.shared.signOut()
        showLogin(withWindow: window)
    }
    
    func showLogin(withWindow window: UIWindow?) {
        window?.subviews.forEach { $0.removeFromSuperview() }
        window?.rootViewController = nil
        window?.rootViewController = AppStoryboard.account.instance.instantiateInitialViewController()
        window?.makeKeyAndVisible()
    }
    
    func showMainApp(withWindow window: UIWindow?) {
        window?.rootViewController = nil
        window?.rootViewController = AppStoryboard.main.instance.instantiateInitialViewController()
        window?.makeKeyAndVisible()
    }
}




