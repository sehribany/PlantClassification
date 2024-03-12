//
//  SettingViewController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 7.03.2024.
//

import UIKit

class SettingViewController: UIViewController {
    
    private let profileView = ProfileView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
    }

}

//MARK: -UILayout
extension SettingViewController{
    
    private func addSubView(){
        self.addView()
    }
    
    private func addView(){
        view.addSubview(profileView)
    }
}
