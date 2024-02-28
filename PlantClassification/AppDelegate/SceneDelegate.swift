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
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible() 
    }
}
