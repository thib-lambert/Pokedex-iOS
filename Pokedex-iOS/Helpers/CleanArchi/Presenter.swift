//
//  Presenter.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 13/03/2021.
//

class Presenter<V: UIViewController> {
    
    // MARK: - Variables
    weak var viewController: V?
    
    // MARK: - Init
    required init(with controller: V) {
        self.viewController = controller
    }
}
