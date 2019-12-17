//
//  AppDelegate.swift
//  RealmViper
//
//  Created by giovane barreira on 03/06/19.
//  Copyright © 2019 giovane barreira. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let window = window {
            window.makeKeyAndVisible()
            
            let mainScreen = MainScreenRouter.createModule()
            navigationController.viewControllers = [mainScreen]
            window.rootViewController = navigationController
        }
        
        
        return true
    }


}

