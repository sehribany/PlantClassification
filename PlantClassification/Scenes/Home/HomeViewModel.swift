//
//  HomeViewModel.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 5.03.2024.
//

import Foundation

protocol HomeViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol
}

protocol HomeViewEventSource {
    var didSuccessFetchPlants: (() -> Void)? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel, HomeViewProtocol {
    var didSuccessFetchPlants: (() -> Void)?
    var cellItems: [HomeCellProtocol] = []
    var page             = 1
    var isPagingEnabled  = false
    
    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol {
        return cellItems[indexPath.row]
    }
    
}
//MARK: - Network
extension HomeViewModel{
    func fetchPlants(completion: @escaping (Error?) -> Void) {
        PlantManager.shared.fetchPlants { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let cellItem = response.map({ HomeCellModel(plant: $0) })
                self.cellItems.append(contentsOf: cellItem)
                self.page += 1
                self.didSuccessFetchPlants?()
            case .failure(let error):
                print("Hata: \(error)")
            }
        }
    }
}
