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
    private var configurationWorker = ConfigurationWorker()
    private var pokemonWorker = PokemonWorker()
    
    // MARK: - Refresh
    func refreshAllData() {
        self.presenter.loadingData()
        
        _ = configurationWorker.fetchData()
            .then { [weak self] count -> Guarantee<Void> in
                
                guard let strongSelf = self,
                      strongSelf.pokemonWorker.getAll().count != count
                else { return .value }
                
                var subRequests: [Promise<Void>] = []
                for pokemonId in 1...count {
                    let request = strongSelf.pokemonWorker.fetchData(pokemonId: pokemonId)
                    subRequests.append(request)
                }
                
                return when(resolved: subRequests).asVoid()
            }
            .done {
                self.presenter.didLoadData()
            }
    }
}
