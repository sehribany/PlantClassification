//
//  AppDelegate.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 19.02.2024.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Thread.sleep(forTimeInterval: 3)
        FirebaseApp.configure()
        window = UIWindow(frame: UIScreen.main.bounds)
        let mainNavigationController = MainNavigationController()
        let viewController = LoginViewController(viewModel: LoginViewModel())
        mainNavigationController.pushViewController(viewController, animated: false)
        
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
            
        return true
    }
}

