//
//  RegisterViewController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 28.02.2024.
//

import UIKit
import FirebaseAuth

class RegisterViewController: BaseViewController<RegisterViewModel> {

    private let registerView = RegisterView()
    
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
        registerView.toLoginButton.addTarget(self, action: #selector(toLogin), for: .touchUpInside)
        registerView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        view.addSubview(registerView)
        registerView.edgesToSuperview()
    }
}
//MARK: -Actions
extension RegisterViewController{
    
    @objc
    private func toLogin(){
        navigationController?.pushViewController(LoginViewController(viewModel: LoginViewModel()), animated: true)
    }
    
    @objc
    private func register(){
        self.authenticationRegister(viewController: self)
    }
    
    func authenticationRegister(viewController: UIViewController){
        if registerView.userSwitch.isOn{
            if let email = registerView.emailText.text, let password = registerView.passwordText.text{
                Auth.auth().createUser(withEmail: email, password: password){ authResult, error in
                    if let error = error {
                        AlertManager.showAlert(title: localizedString("Alert.error"), message: localizedString("Alert.errorTitleR") + ": \(error.localizedDescription)", viewController: viewController)
                    } else {
                        AlertManager.showAlert(title: localizedString("Alert.success"), message: localizedString("Alert.successTitle"), viewController: viewController)
                    }
                }
            }else{
                AlertManager.showAlert(title: localizedString("Alert.error"), message: localizedString("Alert.nillText"), viewController: viewController)
            }
        }else{
            AlertManager.showAlert(title: localizedString("Alert.alert"), message: localizedString("Alert.switch"), viewController: viewController)
        }
    }
}
