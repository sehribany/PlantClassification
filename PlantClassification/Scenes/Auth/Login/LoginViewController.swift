//
//  LoginViewController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 28.02.2024.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import GoogleSignIn

class LoginViewController: BaseViewController<LoginViewModel> {
    
    private let backGroundImage: UIImageView = {
        let imageView   = UIImageView()
        imageView.image = UIImage(named: "imgLogin")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label           = UILabel()
        label.textColor     = .appWhiteWrite
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font          = UIFont.boldSystemFont(ofSize: 41)
        label.text          = localizedString("Login.welcome")
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label           = UILabel()
        label.textColor     = .appWhiteWrite
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font          = UIFont.systemFont(ofSize: 15)
        label.text          = localizedString("Login.description")
        return label
    }()
    
    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        self.addSubView()
    }
}

//MARK: -UILayout
extension LoginViewController{
    private func addSubView(){
        backgroundImage()
        addView()
        addTitles()
    }
    
    private func backgroundImage(){
        view.addSubview(backGroundImage)
        backGroundImage.edgesToSuperview()
    }
    
    private func addTitles(){
        view.addSubview(welcomeLabel)
        welcomeLabel.topToSuperview().constant = 70
        welcomeLabel.leadingToSuperview().constant = 25
        view.addSubview(descriptionLabel)
        descriptionLabel.topToBottom(of: welcomeLabel).constant = 10
        descriptionLabel.leadingToSuperview().constant = 25
        descriptionLabel.trailingToSuperview().constant = -13
    }
    
    private func addView(){
        view.addSubview(loginView)
        loginView.bottomToSuperview()
        loginView.leadingToSuperview()
        loginView.trailingToSuperview()
        loginView.topToSuperview().constant = 200
        loginView.layer.cornerRadius = 20
        loginView.toRegisterButton.addTarget(self, action: #selector(toRegister), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        loginView.googleButton.addTarget(self, action: #selector(googleLogin), for: .touchUpInside)
    }
}

//MARK: -Actions
extension LoginViewController{
    @objc
    private func toRegister(){
        navigationController?.pushViewController(RegisterViewController(viewModel: RegisterViewModel()), animated: true)
    }
    
    @objc
    private func login(){
        self.authenticationLogin(viewController: self)
    }
    
    @objc
    private func googleLogin(){
        self.authenticationGoogleLogin(viewController: self)
    }
}
//MARK: - Login
extension LoginViewController{
    
    private func authenticationLogin(viewController: UIViewController){
        if let email = loginView.emailText.text, let password = loginView.passwordText.text{
            Auth.auth().signIn(withEmail: email, password: password){ authResult, error in
                if let error = error {
                    AlertManager.showAlert(title: localizedString("Alert.error"), message: localizedString("Alert.errorTitleL") + ": \(error.localizedDescription)", viewController: viewController)
                } else {
                    self.navigationController?.pushViewController(MainTabBarController(), animated: true)
                }
            }
        }else{
            AlertManager.showAlert(title: localizedString("Alert.error"), message: localizedString("Alert.nillText"), viewController: viewController)
        }
    }
    
    private func authenticationGoogleLogin(viewController:UIViewController){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            if let e = error {
                AlertManager.showAlert(title: localizedString("Alert.alert"), message: e.localizedDescription, viewController: viewController)
                return
            }
            
            guard let user = result?.user, let idToken = user.idToken?.tokenString else{
                AlertManager.showAlert(title: localizedString("Alert.alert"), message: localizedString("Alert.errorgoogle"), viewController: viewController)
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            Auth.auth().signIn(with: credential) { authResult, error in
                if let e = error {
                    AlertManager.showAlert(title: localizedString("Alert.alert"), message: e.localizedDescription, viewController: viewController)
                } else {
                    self.navigationController?.pushViewController(MainTabBarController(), animated: true)
                }
            }
        }
        
    }
}
