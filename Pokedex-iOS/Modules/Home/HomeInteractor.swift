//
//  HomeInteractor.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 14/03/2021.
//

class HomeInteractor: Interactor<HomeViewController, HomePresenter> {
    
    // MARK: - Workers
    private lazy var pokemonWorker: PokemonWorker = {
        let worker = PokemonWorker()
        worker.delegate = self
        return worker
    }()
    
    // MARK: - Refresh
    func refresh() {
        self.pokemonWorker.fetchData()
    }
}

// MARK: - PokemonWorkerDelegate
extension HomeInteractor: PokemonWorkerDelegate {
    func didFetchData(_ data: [Pokemon]) {
        self.presenter.refresh(data)
    }
}
