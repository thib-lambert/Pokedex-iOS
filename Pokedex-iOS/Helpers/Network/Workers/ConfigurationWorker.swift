//
//  ConfigurationWorker.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 13/03/2021.
//

import PromiseKit

class ConfigurationWorker: Worker {
    
    // MARK: - Fetch
    @discardableResult
    func fetchData() -> Promise<Int> {
        
        ConfigurationRequest()
            .response(ConfigurationResponse.self)
            .then { config -> Promise<Int> in
                // TODO: Return good value
                return .value(3)
            }
    }
}
