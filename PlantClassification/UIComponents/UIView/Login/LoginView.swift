//
//  LoginView.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 28.02.2024.
//

import UIKit

public class LoginView: UIView {
    
    private let emailLabel: UILabel = {
        let label  = UILabel()
        label.text = localizedString("Login.email")
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .appGray
        return label
    }()
        
    public let emailText : UITextField = {
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
        let imageContentView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 60))
        let imageView = UIImageView(image: UIImage(named: "icEmail"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 18, width: 24, height: 24)
        imageContentView.addSubview(imageView)
        text.leftView = imageContentView
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
        
    public let passwordText : UITextField = {
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
        let imageContentView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 60))
        let imageView = UIImageView(image: UIImage(named: "icPassword"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 10, y: 18, width: 24, height: 24)
        imageContentView.addSubview(imageView)
        text.leftView = imageContentView
        text.leftViewMode = .always
        return text
    }()
    
    public let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .appSplashGreen
        button.setTitle(localizedString("Login.login"), for: .normal)
        button.tintColor = .appWhite
        button.layer.cornerRadius = 9
        button.titleLabel?.font  = UIFont.systemFont(ofSize: 23)
        return button
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = localizedString("Login.or")
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .appGray
        return label
    }()
    
    public let googleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .appWhiteWrite
        button.setTitle(localizedString("Login.google"), for: .normal)
        button.tintColor = .appGray
        button.layer.cornerRadius = 9
        button.layer.borderWidth  = 0.5
        button.layer.borderColor = UIColor.appSplashGreen.cgColor
        button.titleLabel?.font  = UIFont.systemFont(ofSize: 23)
        let image = UIImage(named: "icGoogle")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 80 , y: 14 , width: 23, height: 22)
        button.addSubview(imageView)
        return button
    }()
    
    private let toRegisterLabel: UILabel = {
        let label  = UILabel()
        label.text = localizedString("Login.toRegister")
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .appGray
        return label
    }()
    
     public let toRegisterButton: UIButton = {
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -UILayout
extension LoginView{
    private func addSubView(){
        backgroundColor = UIColor.appWhiteWrite
        addEmail()
        addEmailText()
        addPassword()
        addPasswordText()
        addtoRegister()
        addLoginButton()
        addorLabel()
        addGoogleButton()
        setupKeyboardLayout()
        addTapGestureToDismissKeyboard()
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
        loginButton.topToBottom(of: passwordText).constant = 30
        loginButton.height(50)
    }
    
    private func addorLabel(){
        addSubview(orLabel)
        orLabel.centerXToSuperview()
        orLabel.topToBottom(of: loginButton).constant = 25
    }
    
    private func addGoogleButton(){
        addSubview(googleButton)
        googleButton.leadingToSuperview().constant  = 25
        googleButton.trailingToSuperview().constant = -25
        googleButton.topToBottom(of: orLabel).constant = 25
        googleButton.height(50)
    }
    
    private func addtoRegister(){
        addSubview(toRegisterLabel)
        addSubview(toRegisterButton)
        toRegisterLabel.bottomToSuperview().constant = -70
        toRegisterLabel.leadingToSuperview().constant = 85
        toRegisterButton.leadingToTrailing(of: toRegisterLabel).constant = 5
        toRegisterButton.bottomToSuperview().constant = -64
    }
    private func setupKeyboardLayout(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//MARK: -Keyboeard
extension LoginView{
    private func addTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(tapGesture)
        tapGesture.cancelsTouchesInView = false
    }
    
    @objc private func dismissKeyboard(){
        self.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let keyboardHeight = keyboardFrame.cgRectValue.height
            let bottomSpace = frame.height - (loginButton.frame.origin.y + loginButton.frame.height)
            frame.origin.y -= keyboardHeight - bottomSpace + 15
        }
    }
        
    @objc private func keyboardWillHide(notification: NSNotification) {
        frame.origin.y = 200
    }
}
