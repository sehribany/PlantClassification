//
//  RegisterViewController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 28.02.2024.
//

import UIKit

class RegisterViewController: BaseViewController<RegisterViewModel> {

    private let uiview: UIView = {
        let view = RegisterView()
        view.toLoginButton.addTarget(self, action: #selector(toLogin), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addSubView()
    }
}

//MARK: -UILayout
extension RegisterViewController{
    private func addSubView(){
        addView()
    }
    
    private func addView(){
        view.addSubview(uiview)
        uiview.edgesToSuperview()
    }
}
//MARK: -Actions
extension RegisterViewController{
    @objc
    private func toLogin(){
        navigationController?.pushViewController(LoginViewController(viewModel: LoginViewModel()), animated: true)
    }
}
