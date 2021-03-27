//
//  PokemonsController.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 08/03/2021.
//

class PokemonsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.separatorStyle = .none
            self.tableView.tableFooterView = UIView()
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

        self.interactor.refresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    // MARK: - Refresh
    func didRefresh(_ pokemons: [Pokemon]) {
        self.pokemons = pokemons
        self.tableView.reloadData()
    }
}

// MARK: - Storyboard
extension PokemonsViewController: StoryboardProtocol {
    static var storyboardName: String { R.storyboard.pokemons.name }
    static var identifier: String? { R.storyboard.pokemons.pokemonsViewController.identifier }
}

// MARK: - UITableViewDataSource
extension PokemonsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PokemonCell = tableView.dequeueCell()
        cell.pokemon = self.pokemons[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewController = R.storyboard.pokemons.pokemonDetailViewController() {
            viewController.pokemon = self.pokemons[indexPath.row]
            self.show(viewController, sender: self)
        }
    }
}
