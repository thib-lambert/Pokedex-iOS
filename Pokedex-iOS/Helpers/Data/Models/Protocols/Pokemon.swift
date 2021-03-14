//
//  Pokemon.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 14/03/2021.
//

protocol Pokemon {
    var id: Int { get }
    var name: String { get }
    var url: String? { get }
}
