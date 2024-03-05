//
//  HomeViewModel.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 5.03.2024.
//

protocol HomeViewDataSource {
   
}

protocol HomeViewEventSource {
   
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
   
}

final class HomeViewModel: BaseViewModel, HomeViewProtocol {

}
