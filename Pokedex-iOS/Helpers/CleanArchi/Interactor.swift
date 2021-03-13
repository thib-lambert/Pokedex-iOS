//
//  Interactor.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 13/03/2021.
//

class Interactor<V: UIViewController, P: Presenter<V>> {
    
    // MARK: - Variables
    var presenter: P
    
    // MARK: - Init
    init(with controller: V) {
        self.presenter = P(with: controller)
    }
}
