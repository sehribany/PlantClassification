//
//  APIDecodableResponseRequest.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 14.03.2024.
//

public protocol APIDecodableResponseRequest: DecodableResponseRequest {}

// MARK: - RequestEncoding
public extension APIDecodableResponseRequest {
    var encoding: RequestEncoding {
        switch method {
        case .get:
            return .url
        default:
            return .json
        }
    }
}

// MARK: - Url
public extension APIDecodableResponseRequest {
    var url: String {               
        return "https://trefle.io/api/v1/plants" + path1 + "?token=0RvN-0pZQJupHwwJKZdWnGoYpHBPSzd7JYXa8uqFNOY" + path2
    }
}

// MARK: - RequestParameters
public extension APIDecodableResponseRequest {
    var parameters: [String: Any] { return [:]}
}

// MARK: - RequestHeaders
public extension APIDecodableResponseRequest {
    var headers: [String: String] { return [:]}
}
