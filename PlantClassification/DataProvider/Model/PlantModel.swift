//
//  PlantModel.swift
//  PlantClassification
//
//  Created by Şehriban Yıldırım on 10.03.2024.
//

public struct PlantModel: Codable {
    let id: Int
    let commonName, slug, scientificName: String
    let year: Int
    let bibliography, author: String
    let familyCommonName: String?
    let genusID: Int
    let imageURL: String
    let synonyms: [String]
    let genus, family: String

    enum CodingKeys: String, CodingKey {
        case id
        case commonName = "common_name"
        case slug
        case scientificName = "scientific_name"
        case year, bibliography, author
        case familyCommonName = "family_common_name"
        case genusID = "genus_id"
        case imageURL = "image_url"
        case synonyms, genus, family
    }
}
