//
//  HomeViewController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 5.03.2024.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationBarLogo()
        view.backgroundColor = .appWhite
        addSettingsButton()
    }

    private func addSettingsButton() {
        let settingsButton = UIBarButtonItem(image: UIImage(named: "icSetting"), style: .plain, target: self, action: #selector(settingsButtonTapped))
        navigationItem.rightBarButtonItem = settingsButton
    }

    @objc private func settingsButtonTapped() {
        navigationController?.pushViewController(SettingViewController(), animated: true)
    }

}
