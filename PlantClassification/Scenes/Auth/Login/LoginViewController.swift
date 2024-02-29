//
//  LoginViewController.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 28.02.2024.
//

import UIKit

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
    
    private let uiview: UIView = {
        let view = LoginView()
        view.toRegisterButton.addTarget(self, action: #selector(toRegister), for: .touchUpInside)
        return view
    }()
    
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
        view.addSubview(uiview)
        uiview.bottomToSuperview()
        uiview.leadingToSuperview()
        uiview.trailingToSuperview()
        uiview.topToSuperview().constant = 200
        uiview.layer.cornerRadius = 20
    }
}

//MARK: -Actions
extension LoginViewController{
    @objc
    private func toRegister(){
        navigationController?.pushViewController(RegisterViewController(viewModel: RegisterViewModel()), animated: true)
    }
}
