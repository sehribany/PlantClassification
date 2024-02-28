//
//  LoginView.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 28.02.2024.
//

import UIKit

class LoginView: UIView {
    
    private let emailLabel: UILabel = {
        let label  = UILabel()
        label.text = localizedString("Login.email")
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .appGray
        return label
    }()
        
    private let emailText : UITextField = {
        let text = UITextField()
        text.backgroundColor = .appGreenLight
        text.textColor = .appGray
        text.font = UIFont.systemFont(ofSize: 15)
        let placeholderFont = UIFont.systemFont(ofSize: 15)
        let placeholderColor = UIColor.appGray
        let attributes = [NSAttributedString.Key.font: placeholderFont,NSAttributedString.Key.foregroundColor: placeholderColor]
        text.attributedPlaceholder = NSAttributedString(string:localizedString("Login.emailplace"),attributes: attributes )
        text.layer.cornerRadius = 9
        text.keyboardType = .emailAddress
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        let imageView = UIImageView(image: UIImage(named: "icEmail"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 0, width: 24, height: 24)
        paddingView.addSubview(imageView)
        text.leftView = paddingView
        text.leftViewMode = .always
        return text
    }()
    
    private let passwordLabel: UILabel = {
        let label  = UILabel()
        label.text = localizedString("Login.password")
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .appGray
        return label
    }()
        
    private let passwordText : UITextField = {
        let text = UITextField()
        text.backgroundColor = .appGreenLight
        text.textColor = .appGray
        text.font = UIFont.systemFont(ofSize: 15)
        let placeholderFont = UIFont.systemFont(ofSize: 15)
        let placeholderColor = UIColor.appGray
        let attributes = [NSAttributedString.Key.font: placeholderFont,NSAttributedString.Key.foregroundColor: placeholderColor]
        text.attributedPlaceholder = NSAttributedString(string:localizedString("Login.passwordplace"),attributes: attributes )
        text.layer.cornerRadius = 9
        text.isSecureTextEntry = true
    
        let imageView = UIImageView(image: UIImage(named: "icPassword"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        text.leftView = imageView
        text.leftViewMode = .always
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .appSplashGreen
        button.setTitle(localizedString("Login.login"), for: .normal)
        button.tintColor = .appWhite
        button.layer.cornerRadius = 9
        button.titleLabel?.font  = UIFont.systemFont(ofSize: 23)
        return button
    }()
    
    private let toRegisterLabel: UILabel = {
        let label  = UILabel()
        label.text = localizedString("Login.toRegister")
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .appGray
        return label
    }()
    
    private let toRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.setTitle(localizedString("Register.register"), for: .normal)
        button.tintColor = .appSplashGreen
        button.titleLabel?.font  = UIFont.systemFont(ofSize: 14)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        backgroundColor = UIColor.appWhiteWrite
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: -UILayout
extension LoginView{
    private func addSubView(){
        addEmail()
        addEmailText()
        addPassword()
        addPasswordText()
        addtoRegister()
        addLoginButton()
    }
    
    private func addEmail(){
        addSubview(emailLabel)
        emailLabel.topToSuperview().constant = 40
        emailLabel.leadingToSuperview().constant = 25
        emailLabel.trailingToSuperview().constant = -100
    }
    
    private func addEmailText(){
        addSubview(emailText)
        emailText.topToBottom(of: emailLabel).constant = 10
        emailText.leadingToSuperview().constant  = 25
        emailText.trailingToSuperview().constant = -25
        emailText.height(60)
    }
    
    private func addPassword(){
        addSubview(passwordLabel)
        passwordLabel.topToBottom(of: emailText).constant = 20
        passwordLabel.leadingToSuperview().constant = 25
        passwordLabel.trailingToSuperview().constant = -100
    }
    
    private func addPasswordText(){
        addSubview(passwordText)
        passwordText.topToBottom(of: passwordLabel).constant = 10
        passwordText.leadingToSuperview().constant  = 25
        passwordText.trailingToSuperview().constant = -25
        passwordText.height(60)
    }
    
    private func addLoginButton(){
        addSubview(loginButton)
        loginButton.leadingToSuperview().constant = 25
        loginButton.trailingToSuperview().constant = -25
        loginButton.bottomToTop(of: toRegisterLabel).constant = -20
        loginButton.height(60)
    }
    
    private func addtoRegister(){
        addSubview(toRegisterLabel)
        addSubview(toRegisterButton)
        toRegisterLabel.bottomToSuperview().constant = -70
        toRegisterLabel.leadingToSuperview().constant = 85
        toRegisterButton.leadingToTrailing(of: toRegisterLabel).constant = 5
        toRegisterButton.bottomToSuperview().constant = -64
        
    }
}
