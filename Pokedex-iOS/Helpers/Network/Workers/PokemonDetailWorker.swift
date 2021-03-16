//
//  PokemonDetailWorker.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 16/03/2021.
//

class PokemonDetailWorker: Worker {
    
    private var pokemonId: Int
    
    init(pokemonId: Int) {
        self.pokemonId = pokemonId
    }
    
    // MARK: - Fetch
    func fetchData() {
        _ = PokemonDetailRequest(pokemonId: self.pokemonId)
            .response(PokemonDetailResponse.self)
            .done { pokemonDetail in
                print(pokemonDetail)
            }
            .recover { error in
                log(error: error)
            }
    }
}
