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
    }


}
