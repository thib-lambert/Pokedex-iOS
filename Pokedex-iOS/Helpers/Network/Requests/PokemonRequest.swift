//
//  PokemonRequest.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 16/03/2021.
//

import NetworkUtilsKit

struct PokemonRequest: PokeApiRequest, MockProtocol {

    var pokemonId: Int
    var path: String { "/api/v2/pokemon/\(pokemonId)" }

    var mockFileURL: URL? { R.file.pokemonMockJson() }
}
