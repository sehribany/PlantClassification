//
//  RequestProtocol.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 14.03.2024.
//

public protocol RequestProtocol{
    var path1      : String{ get }
    var path2      : String{ get }
    var method     : RequestMethod { get }
    var parameters : [String: Any] { get }
    var headers    : [String: String] { get }
    var encoding   : RequestEncoding { get }
    var url        : String { get }
}
