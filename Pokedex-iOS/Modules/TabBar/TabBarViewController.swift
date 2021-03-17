//
//  TabBarViewController.swift
//  Pokedex-iOS
//
//  Created by Thibaud Lambert on 17/03/2021.
//

private enum TabBarItem: CaseIterable {
    case pokemons
    
    // MARK: - Variables
    var title: String? {
        switch self {
        case .pokemons: return "Pokemons"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .pokemons: return UIImage(systemName: "books.vertical.fill")
        }
    }
    
    var viewController: UIViewController? {
        switch self {
        case .pokemons: return PokemonsViewController.fromStoryboard()
        }
    }
}

class TabBarViewController: UITabBarController, NavigationProtocol {
    
    // MARK: - Properties
    static var current: TabBarViewController?
    
    // MARK: - Navigation protocol
    var navigationSegue: Segue = .modal
    var instanceIdentifier: String?
    var previousViewController: UIViewController?

    // MARK: - Init
    deinit {
        log(.tag, "Deinit Tar Bar")
    }

    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set current Tab bar
        Self.current = self
        
        // Appearance
        self.tabBar.tintColor = .red
        
        // Set viewControllers
        self.viewControllers = TabBarItem.allCases.compactMap { item -> UIViewController? in
            guard let viewController = item.viewController else { return nil }
            let tabBarItem = UITabBarItem(title: item.title, image: item.image, selectedImage: item.image)
            viewController.tabBarItem = tabBarItem
            return viewController
        }
        
        self.showPokemon()
    }
    
    private func showPokemon() {
        self.selectedIndex = 0
    }
}

// MARK: - Storyboard protocol
extension TabBarViewController: StoryboardProtocol {
    static var storyboardName: String { "TabBar" }
    static var identifier: String? { "TabBarViewController" }
}
