//
//  PokemonDetailResponse.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 16/03/2021.
//

struct PokemonDetailResponse: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case isDefault = "is_default"
        case weight, height, name
    }

    var id: Int
    var isDefault: Bool
    var weight: Int
    var height: Int
    var name: String
}
