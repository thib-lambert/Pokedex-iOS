//
//  PokemonDetailViewController.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 27/03/2021.
//

class PokemonDetailViewController: UIViewController {
    
    // MARK: - Variables
    var pokemon: Pokemon? {
        didSet {
            guard let pokemon = self.pokemon else { return }
            self.title = pokemon.name
        }
    }
}
