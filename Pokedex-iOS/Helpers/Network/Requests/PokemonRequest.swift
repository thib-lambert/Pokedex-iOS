//
//  PokemonRequest.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 13/03/2021.
//

import NetworkUtilsKit
import PromiseKit

struct PokemonRequest: PokeApiRequest {

    var path: String { "/api/v2/pokemon" }
    var parameters: Parameters? { ["limit": Configuration.shared.kPokemonNumber] }
}
