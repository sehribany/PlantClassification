//
//  LoginViewModel.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 28.02.2024.
//

protocol LoginViewDataSource {}

protocol LoginViewEventSource {}

protocol LoginViewProtocol: LoginViewDataSource, LoginViewEventSource {}

final class LoginViewModel: BaseViewModel, LoginViewProtocol {}
