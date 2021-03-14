//
//  DB_Pokemon.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 14/03/2021.
//

// MARK: - CoreDataModel
extension DB_Pokemon: CoreDataModel {

    public static var primaryKey: String { "a_id" }
    public static var entityName: String { "DB_Pokemon" }
}

extension DB_Pokemon {

    static func update(with pokemons: [Pokemon]) {
        pokemons.forEach { pokemon in
            let pokemonEntity = DB_Pokemon.findOrCreate(with: pokemon.id)
            pokemonEntity?.update(with: pokemon)
        }
    }

    func update(with pokemon: Pokemon) {
        // Attributes
        self.a_id = Int16(pokemon.id)
        self.a_name = pokemon.name
        self.a_url = pokemon.url
    }
}

// MARK: - Pokemon
extension DB_Pokemon: Pokemon {
    public var id: Int { Int(self.a_id) }
    var name: String { self.a_name ?? "No name" }
    var url: String? { self.a_url }
}
