//
//  PokemonCell.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 17/03/2021.
//

class PokemonCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var pokemonIdLabel: UILabel!
    @IBOutlet private weak var pokemonLabel: UILabel!
    @IBOutlet private weak var pokemonImageView: UIImageView!

    // MARK: - Variables
    var pokemon: Pokemon? {
        didSet {
            guard let pokemon = self.pokemon else { return }

            self.pokemonIdLabel.text = "\(pokemon.id)"
            self.pokemonLabel.text = NSLocalizedString(pokemon.name, comment: pokemon.name)
            // TODO: Setup image
            self.pokemonImageView.image = R.image.pokemonLogo()
        }
    }
}

// MARK: - ViewReusable
extension PokemonCell: ViewReusable {
    static var identifier: String { R.reuseIdentifier.pokemonCell.identifier }
}
