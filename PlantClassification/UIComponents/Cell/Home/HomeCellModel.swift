//
//  HomeCellModel.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 10.03.2024.
//

import Foundation

public protocol HomeCellDataSource: AnyObject{
    var plant: PlantModel {get}
}

public protocol HomeCellEventSource: AnyObject{}

public protocol HomeCellProtocol: HomeCellDataSource, HomeCellEventSource{}

public final class HomeCellModel: HomeCellProtocol{
    public var plant: PlantModel
    
    public init(plant: PlantModel) {
        self.plant = plant
    }
}
