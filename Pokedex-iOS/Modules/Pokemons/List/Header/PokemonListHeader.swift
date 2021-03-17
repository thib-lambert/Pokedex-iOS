//
//  PokemonListHeader.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 17/03/2021.
//

class PokemonListHeader: UIView {
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    private func setup() {
        self.xibSetup()
    }
}
