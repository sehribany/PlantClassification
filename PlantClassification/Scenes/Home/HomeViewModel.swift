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
    var cellItems            : [HomeCellModel] = []
    var cellItemsSearch      : [HomeCellModel] = []
    var page     = 1
    var isRequestEnabled = false
    var isPagingEnabled  = false
    
    func numberOfItemsAt(section: Int) -> Int {
        if !cellItemsSearch.isEmpty {
            return cellItemsSearch.count
        } else {
            return cellItems.count
        }
    }
    
    func cellItemAt(indexPath: IndexPath) -> HomeCellProtocol {
        if !cellItemsSearch.isEmpty {
            return cellItemsSearch[indexPath.row]
        } else {
            return cellItems[indexPath.row]
        }
    }
}
// MARK: - Network
extension HomeViewModel {
    
    func fetchPlants(page: Int) {
        let request = GetPlantsRequest(page: page)
        self.isRequestEnabled = false
        if page == 1 { showActivityIndicatorView?() }
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result{
            case .success(let response):
                self.cellItems.removeAll()
                let cellItems = response.data.map({HomeCellModel(plant: $0 )})
                self.cellItems.append(contentsOf: cellItems)
                self.didSuccessFetchPlants?()
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    func fetchMorePages(){
        let nextPage = self.page + 1
        fetchPlants(page: nextPage)
        self.page = nextPage
    }
    
    func fetchSearch(searchTitle: String){
        let request = GetSearchPlantsRequest(searchTitle: searchTitle)
        self.isRequestEnabled = false
        dataProvider.request(for: request) { [weak self] result in
            guard let self = self else { return }
            self.hideActivityIndicatorView?()
            self.isRequestEnabled = true
            switch result{
            case .success(let response):
                self.cellItemsSearch.removeAll()
                let cellItems = response.data.map({HomeCellModel(plant: $0 )})
                self.cellItemsSearch.append(contentsOf: cellItems)
                self.didSuccessFetchPlants?()
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
    
    func fetchMorePages(searchTitle: String) {
        fetchSearch(searchTitle: searchTitle)
    }
}
