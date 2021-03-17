//
//  PokemonsController.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 08/03/2021.
//

import UIKit

class PokemonsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.tableFooterView = UIView()
            self.tableView.tableHeaderView = PokemonListHeader(frame: CGRect(origin: .zero, size: CGSize(width: 0, height: 50)))
            self.tableView.register(PokemonCell.self)
        }
    }

    // MARK: - Variables
    private lazy var interactor: PokemonsInteractor = {
        PokemonsInteractor(with: self)
    }()
    private var pokemons: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Pokemons"

        self.interactor.refresh()
    }

    // MARK: - Refresh
    func didRefresh(_ pokemons: [Pokemon]) {
        self.pokemons = pokemons
        self.tableView.reloadData()
    }
}

// MARK: - Storyboard
extension PokemonsViewController: StoryboardProtocol {
    static var storyboardName: String { "Pokemons" }
    static var identifier: String? { "PokemonsViewController" }
}

// MARK: - UITableViewDataSource
extension PokemonsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonCell = tableView.dequeueCell()
        cell.pokemon = self.pokemons[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
