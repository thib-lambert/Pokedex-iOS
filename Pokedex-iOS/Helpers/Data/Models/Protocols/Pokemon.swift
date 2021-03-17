//
//  Pokemon.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 14/03/2021.
//

protocol Pokemon {
    var id: Int { get }
    var isDefault: Bool { get }
    var weight: Int { get }
    var height: Int { get }
    var name: String { get }
}
