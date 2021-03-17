//
//  PokemonsPresenter.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 14/03/2021.
//

class PokemonsPresenter: Presenter<PokemonsViewController> {
    
    // MARK: - Refresh
    func refresh(with pokemons: [Pokemon]) {
        self.view?.didRefresh(pokemons)
    }
}
