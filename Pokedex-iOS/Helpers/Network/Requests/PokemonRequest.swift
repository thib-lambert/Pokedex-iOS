//
//  PokemonRequest.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 16/03/2021.
//

struct PokemonRequest: PokeApiRequest {

    var pokemonId: Int
    var path: String { "/api/v2/pokemon/\(pokemonId)" }
}
