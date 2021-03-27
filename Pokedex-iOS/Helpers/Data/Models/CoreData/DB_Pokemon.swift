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
    
    static func update(with pokemon: Pokemon) {
        if let pokemonEntity = DB_Pokemon.findOrCreate(with: pokemon.id) {
            
            // Attributes
            pokemonEntity.a_id = Int16(pokemon.id)
            pokemonEntity.a_isDefault = pokemon.isDefault
            pokemonEntity.a_weight = Int16(pokemon.weight)
            pokemonEntity.a_height = Int16(pokemon.height)
            pokemonEntity.a_name = pokemon.name
        }
    }
}

// MARK: - Pokemon
extension DB_Pokemon: Pokemon {
    
    public var id: Int { Int(self.a_id) }
    var isDefault: Bool { self.a_isDefault }
    var weight: Int { Int(self.a_weight) }
    var height: Int { Int(self.a_height) }
    var name: String {
        if let name = self.a_name {
            return NSLocalizedString(name, comment: name)
        } else {
            return "No name"
        }
    }
}
