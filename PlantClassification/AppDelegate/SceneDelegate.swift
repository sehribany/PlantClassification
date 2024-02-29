//
//  SceneDelegate.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 19.02.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let mainNavigationController = MainNavigationController()
        let viewController = LoginViewController(viewModel: LoginViewModel())
        mainNavigationController.pushViewController(viewController, animated: false)
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
    }
}
