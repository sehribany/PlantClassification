//
//  GetPlantsRequest.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 14.03.2024.
//

public struct GetPlantsRequest: APIDecodableResponseRequest{
    public typealias ResponseType = Plants
    
    public var path1 : String      = ""
    public var path2 : String      = ""
    public var method: RequestMethod = .get
    public var parameters : [String: Any]    = [:]
    public var headers    : [String: String] = [:]
    
    public init(page: Int){
        print(url)
        self.parameters["page"] = page
    }
}
