//
//  PokemonResponse.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 13/03/2021.
//

struct PokemonResponse: Decodable {

    struct PokemonDataResponse: Decodable, Pokemon {

        enum CodingKeys: String, CodingKey {
            case name, _url = "url"
        }

        let name: String
        let _url: String

        var id: Int {
            let components = self._url.components(separatedBy: "/")
            return Int(components[components.count - 2]) ?? -1
        }
        var url: String? { self._url }
    }

    enum CodingKeys: String, CodingKey {
        case results
    }

    let results: [PokemonDataResponse]
}
