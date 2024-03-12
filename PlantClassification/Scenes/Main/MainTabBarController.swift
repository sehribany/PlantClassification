//
//  MainTabBarController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 5.03.2024.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor       = .appTabBarTitle
        tabBar.backgroundColor = .appTabBar
        let reminderViewController       = createReminderViewController()
        let identificationViewController = createIdentificationViewController()
        let homeViewController           = createHomeViewController()
        viewControllers = [homeViewController, identificationViewController, reminderViewController,]
    }
    
    private func configureTabBarIcons(navController: MainNavigationController, icon:UIImage?) {
        navController.tabBarItem.image = icon
    }
    
    private func configureTabBarTitle(navController: MainNavigationController, title: String?){
        navController.tabBarItem.title = title
    }
    
    private func configureContents() {
        tabBar.tintColor = .appGray
    }
    
    private func createReminderViewController()-> UINavigationController {
        let reminderViewModel      = ReminderViewModel()
        let reminderViewController = ReminderViewController(viewModel: reminderViewModel)
        let navController          = MainNavigationController(rootViewController: reminderViewController)
        configureTabBarIcons(navController: navController, icon: UIImage(named: "icReminder"))
        configureTabBarTitle(navController: navController, title: "Reminder")
        return navController
    }
    
    private func createIdentificationViewController()-> UINavigationController {
        let identificationViewModel      = IdentificationViewModel()
        let identificationViewController = IdentificationViewController(viewModel: identificationViewModel)
        let navController                = MainNavigationController(rootViewController: identificationViewController)
        configureTabBarIcons(navController: navController, icon: UIImage(named: "icScan"))
        configureTabBarTitle(navController: navController, title: "Scan")
        return navController
    }
    
    private func createHomeViewController()-> UINavigationController{
        let homeViewModel      = HomeViewModel()
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        let navController      = MainNavigationController(rootViewController: homeViewController)
        configureTabBarIcons(navController: navController, icon: UIImage(named: "icHome"))
        configureTabBarTitle(navController: navController, title: "Home")
        return navController
    }
}
