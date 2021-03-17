//
//  PokemonsInteractor.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 14/03/2021.
//

class PokemonsInteractor: Interactor<PokemonsViewController, PokemonsPresenter> {

    // MARK: - Workers
    private let pokemonWorker = PokemonWorker()

    // MARK: - Refresh
    func refresh() {
        let pokemons = self.pokemonWorker.getAll()
        self.presenter.refresh(with: pokemons.sorted { $0.id < $1.id })
    }
}
