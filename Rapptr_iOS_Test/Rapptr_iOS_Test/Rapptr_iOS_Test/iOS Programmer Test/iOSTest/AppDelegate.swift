//
//  AppDelegate.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/13/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let mainMenuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        let navController = UINavigationController(rootViewController: mainMenuViewController)
        let navBarTintColor = UIColor(red: 14/255, green: 92/255, blue: 137/255, alpha: 1)
        let navTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        navController.navigationBar.tintColor = navTintColor
        navController.navigationBar.titleTextAttributes = [.foregroundColor: navTintColor]
        UINavigationBar.appearance().barTintColor = navBarTintColor
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

        return true
    }
    
}
