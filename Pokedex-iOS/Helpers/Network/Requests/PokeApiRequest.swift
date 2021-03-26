//
//  PokeApiRequest.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 13/03/2021.
//

import NetworkUtilsKit
import PromiseKit

protocol PokeApiRequest: RequestProtocol { }

// MARK: - PokeApiRequest
extension PokeApiRequest {

    var scheme: String { "https" }
    var host: String { "pokeapi.co" }
    var method: RequestMethod { .get }
    
    /**
     Send request and return response or error
     */
    func response<T: Decodable>(_ type: T.Type) -> Promise<T> {
        Promise { resolver in
            self.response(type) { results in
                switch results {
                case .success(let response): resolver.fulfill(response)
                case .failure(let error): resolver.reject(error)
                }
            }
        }.recover { error -> Promise<T> in
            log(error: error)            
            return .init(error: error)
        }
    }
}

extension MockProtocol {
    
    /**
        Send request and return response or error
     */
    func mock<T: Decodable>(_ type: T.Type) -> Promise<T> {
        Promise { resolver in
            self.mock(type) { results in
                switch results {
                case .success(let response): resolver.fulfill(response)
                case .failure(let error): resolver.reject(error)
                }
            }
        }
    }
}
