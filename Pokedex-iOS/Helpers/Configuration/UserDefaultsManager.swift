//
//  UserDefaultsManager.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 14/03/2021.
//

class UserDefaultsManager {

    // MARK: - Singleton
    static let shared = UserDefaultsManager()

    // MARK: - Variables
    private let defaults: UserDefaults

    private let kLastRefreshDate: String = "kLastRefreshDate"
    var lastRefreshDate: Date {
        get {
            self.defaults.object(forKey: kLastRefreshDate) as? Date ?? Date()
        }
        set {
            self.defaults.setValue(newValue, forKey: kLastRefreshDate)
        }
    }

    // MARK: - Init
    private init() {
        self.defaults = UserDefaults.standard
    }
}
