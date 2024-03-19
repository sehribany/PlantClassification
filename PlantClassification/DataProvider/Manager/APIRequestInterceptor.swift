//
//  APIRequestInterceptor.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 14.03.2024.
//

import Alamofire
import Foundation

public class APIRequestInterceptor: RequestInterceptor {
    
    public static let shared = APIRequestInterceptor()
    
    public func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest  = urlRequest
        completion(.success(urlRequest))
    }
}
