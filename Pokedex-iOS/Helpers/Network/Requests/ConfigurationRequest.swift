//
//  ConfigurationRequest.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 13/03/2021.
//

import NetworkUtilsKit
import PromiseKit

struct ConfigurationRequest: PokeApiRequest {

    var path: String { "/api/v2/pokemon" }
}
