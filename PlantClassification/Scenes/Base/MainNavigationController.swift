//
//  MainNavigationController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 19.02.2024.
//

import UIKit

class MainNavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
    }
    
    private func configureContents(){
        let backImage = UIImage(named: "icBack")?
            .resize(to: .init(width: 11, height: 18))
            .withRenderingMode(.alwaysTemplate)
            .withAlignmentRectInsets(.init(top: 0, left: 0, bottom: -2, right: 0))
        
        
        navigationBar.barTintColor = .appBlack
        navigationBar.shadowImage  = UIImage()
        navigationBar.tintColor    = .appBlack
        navigationBar.backIndicatorImage               = backImage
        navigationBar.backIndicatorTransitionMaskImage = backImage
       
        if #available(iOS 13.0, *) {
            let appearance                     = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.shadowColor             = .appBlack
            appearance.backgroundColor         = .appWhite
            appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
            navigationBar.standardAppearance   = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance    = appearance
        }
        navigationBar.backItem?.backBarButtonItem?.setTitlePositionAdjustment(.init(horizontal: 0, vertical: -13), for: .default)
    }
    
    private func addSettingsButton() {
        let settingsButton = UIBarButtonItem(image: UIImage(named: "icSetting"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.rightBarButtonItem = settingsButton
    }

    @objc private func settingsButtonTapped() {
        navigationController?.pushViewController(SettingViewController(), animated: true)
    }
}
