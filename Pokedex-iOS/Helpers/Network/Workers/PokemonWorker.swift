//
//  PokemonWorker.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 13/03/2021.
//

import PromiseKit

protocol PokemonWorkerDelegate: AnyObject {
    func didFetchData(_ data: [Pokemon])
}

class PokemonWorker: Worker {

    // MARK: - Variables
    weak var delegate: PokemonWorkerDelegate?
    private var forceRefresh: Bool {
        let lastRefreshDate = UserDefaultsManager.shared.lastRefreshDate
        let today = Date()
        
        let calendar = Calendar.current

        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDay(for: lastRefreshDate)
        let date2 = calendar.startOfDay(for: today)
        let components = calendar.dateComponents([.day], from: date1, to: date2)
        let days = components.day ?? 0
        
        return days >= 1 || date1 == date2
    }

    // MARK: - Get
    private func getPokemons() -> [Pokemon] {
        DB_Pokemon.getAll()
    }

    // MARK: - Fetch
    func fetchData() {
        
        // Force refresh from API every day
        if self.forceRefresh {
            _ = PokemonRequest()
                .response(PokemonResponse.self)
                .then { pokemons -> Promise<Void> in
                DB_Pokemon.update(with: pokemons.results)
                return CoreDataManager.default.savePromise()
            }
                .recover { error in
                log(error: error)
            }
                .ensure {
                self.delegate?.didFetchData(self.getPokemons())
            }
        } else {
            self.delegate?.didFetchData(self.getPokemons())
        }
    }
}
