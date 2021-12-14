//
//  AppDelegate.swift
//  Surf_TZ
//
//  Created by MacBook Pro on 12.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var rootNavigationController = UINavigationController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if UserDefaults.isFirstLaunch() {
            let onboardViewConroller = UIStoryboard.get(OnboardViewController.self)
            rootNavigationController = UINavigationController(rootViewController: onboardViewConroller)
        } else {
            let mainViewController = MainViewController()
            rootNavigationController = UINavigationController(rootViewController: mainViewController)
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootNavigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

