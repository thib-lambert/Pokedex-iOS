//
//  ViewController.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 08/03/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
//            self.tableView.register(PokemonCell.self)
        }
    }

    // MARK: - Variables
    private var interactor: HomeInteractor!
    private var pokemons: [Pokemon] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pokemons"

        self.interactor = HomeInteractor(with: self)
        self.interactor.refresh()
    }
    
    // MARK: - Refresh
    func didRefresh(_ pokemons: [Pokemon]) {
        self.pokemons = pokemons
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.pokemons[indexPath.row].name
        return cell
    }
}
