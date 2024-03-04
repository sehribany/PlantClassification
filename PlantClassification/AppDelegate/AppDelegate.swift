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
        var initialViewController: UIViewController
        
        if UserDefaults.standard.bool(forKey: "HasOpenedBefore") {
            initialViewController = LoginViewController(viewModel: LoginViewModel())
            mainNavigationController.pushViewController(initialViewController, animated: false)
            window?.rootViewController = mainNavigationController
        } else {
            initialViewController = IntroViewController(viewModel: IntroViewModel())
            window?.rootViewController = initialViewController
            UserDefaults.standard.set(true, forKey: "HasOpenedBefore")
        }
        window?.makeKeyAndVisible()
        return true
    }
}
