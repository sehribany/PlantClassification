//
//  GetSearchPlants.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 14.03.2024.
//

public struct GetSearchPlantsRequest: APIDecodableResponseRequest{
    
    public typealias ResponseType = Plants
    
    public var path1      : String           = "/search"
    public var path2      : String           = ""
    public var method     : RequestMethod    = .get
    public var parameters : [String: Any]    = [:]
    public var headers    : [String: String] = [:]
    
    public init(searchTitle: String){
        self.path2 = "&q=\(searchTitle)"
    }
}
