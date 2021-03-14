//
//  HomePresenter.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 14/03/2021.
//

class HomePresenter: Presenter<HomeViewController> {
    
    // MARK: - Refresh
    func refresh(_ pokemons: [Pokemon]) {
        self.viewController?.didRefresh(pokemons)
    }
}
