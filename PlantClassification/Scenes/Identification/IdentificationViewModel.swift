//
//  IdentificationViewModel.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 5.03.2024.
//



protocol IdentificationViewDataSource {
    
}

protocol IdentificationViewEventSource {
   
}

protocol IdentificationViewProtocol: IdentificationViewDataSource, IdentificationViewEventSource {
   
}

final class IdentificationViewModel: BaseViewModel, IdentificationViewProtocol {


}
