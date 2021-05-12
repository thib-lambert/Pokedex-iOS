//
//  SplashScreenInteractor.swift
//  Tour de France
//
//  Created by Michael Coqueret on 15/03/2021.
//  Copyright © 2021 L'Équipe. All rights reserved.
//

import PromiseKit

class SplashScreenInteractor: Interactor<SplashScreenViewController, SplashScreenPresenter> {
    
    // MARK: - Variables
    private let configurationWorker = ConfigurationWorker()
    private let pokemonWorker = PokemonWorker()
    
    // MARK: - Refresh
    func refreshAllData() {        
        _ = self.configurationWorker.fetchData()
            .then { [pokemonWorker] count -> Guarantee<Void> in
                guard pokemonWorker.getAll().count != count
                else { return .value }
                
                var subRequests: [Promise<Void>] = []
                for pokemonId in 1...count {
                    let request = pokemonWorker.fetchData(pokemonId: pokemonId)
                    subRequests.append(request)
                }
                
                return when(resolved: subRequests).asVoid()
            }
            .done {
                self.presenter.didLoadData()
            }
    }
}
