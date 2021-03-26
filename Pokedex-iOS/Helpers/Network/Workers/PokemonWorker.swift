//
//  PokemonWorker.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 16/03/2021.
//

import PromiseKit

class PokemonWorker: Worker {
    
    // MARK: - Get
    func getPokemon(pokemonId: Int) -> Pokemon? {
        DB_Pokemon.getAll(predicate: NSPredicate(format: "a_id = %d", pokemonId)).first
    }
    
    func getAll() -> [Pokemon] {
        DB_Pokemon.getAll()
    }
    
    // MARK: - Fetch
    func fetchData(pokemonId: Int) -> Promise<Void> {
        PokemonRequest(pokemonId: pokemonId)
            .mock(PokemonResponse.self)
            .then { pokemon -> Promise<Void> in
                
                DB_Pokemon.update(with: pokemon)
                return CoreDataManager.default.savePromise()
            }
    }
}
