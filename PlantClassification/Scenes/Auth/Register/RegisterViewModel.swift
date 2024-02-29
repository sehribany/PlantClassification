//
//  RegisterViewModel.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 28.02.2024.
//

protocol RegisterViewDataSource {}

protocol RegisterViewEventSource {}

protocol RegisterViewProtocol: RegisterViewDataSource, RegisterViewEventSource {}

final class RegisterViewModel: BaseViewModel, RegisterViewProtocol {}
