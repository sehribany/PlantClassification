//
//  PlantManager.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 10.03.2024.
//

import Foundation
import Alamofire

class PlantManager {
    static let shared = PlantManager()
    
    let API_KEY = "0RvN-0pZQJupHwwJKZdWnGoYpHBPSzd7JYXa8uqFNOY"
    let baseUrl = "https://trefle.io/api/v1/plants?token="
    var page: Int = 1

    func fetchPlants(completion: @escaping (Result<[PlantModel], Error>) -> Void) {
        let urlString = baseUrl + API_KEY + "&page=\(page)"
        AF.request(urlString).responseDecodable(of: Plants.self) { response in
            switch response.result {
            case .success(let plants):
                completion(.success(plants.data))
                self.page += 1
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
