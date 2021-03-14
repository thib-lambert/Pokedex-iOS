//
//  Configuration.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 14/03/2021.
//

import CoreDataUtilsKit

struct Configuration {

    // MARK: - Singleton
    static let shared = Configuration()

    // MARK: - Variables
    let kPokemonNumber = 9

    // MARK: - Init
    private init() {

        // Init CoreData
        do {
            try CoreDataManager.default.setCoreDataStack("Pokedex-iOS",
                                                         bundleId: "fr.thib.Pokedex-iOS")
            log(.data, "Init CoreData")
        } catch {
            log(.data, "Init CoreData", error: error)
        }
    }
}
