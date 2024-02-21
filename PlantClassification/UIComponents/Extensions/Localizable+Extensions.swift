//
//  Localizable+Extensions.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 21.02.2024.
//
import Foundation

func localizedString(_ key: String) -> String {
    return NSLocalizedString(key, tableName: "Localizable", bundle: .main, value: "", comment: "")
}
