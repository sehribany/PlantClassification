//
//  DecodableResponseRequest.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 14.03.2024.
//

public protocol DecodableResponseRequest : RequestProtocol{
    associatedtype ResponseType : Decodable
}
