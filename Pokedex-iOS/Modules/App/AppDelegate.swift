//
//  AppDelegate.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 08/03/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Workers
    private let pokemonWorker =  PokemonWorker()

    // MARK: - Variables
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        #if DEBUG
            if let documentDirectoryURL = try? FileManager().url(for: .documentDirectory,
                                                                 in: .userDomainMask,
                                                                 appropriateFor: nil,
                                                                 create: true) {

                log(.data, "Documents Directory: \(documentDirectoryURL)")
            }
        #endif

        // Init CoreData
        _ = Configuration.shared

        // Fetch data from API
        self.pokemonWorker.fetchData()

        return true
    }
}
