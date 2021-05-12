//
//  SplashScreenViewController.swift
//  Tour de France
//
//  Created by Michael Coqueret on 15/03/2021.
//  Copyright © 2021 L'Équipe. All rights reserved.
//

class SplashScreenViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    @IBOutlet private var views: [UIView]!
    
    // MARK: - Variables
    private lazy var interactor: SplashScreenInteractor = {
        SplashScreenInteractor(with: self)
    }()
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.views.forEach {
            $0.alpha = 0
        }
        self.interactor.refreshAllData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.loader.startAnimating()
        UIView.animate(withDuration: 1) { [views] in
            views?.forEach {
                $0.alpha = 1
            }
        }
    }
    
    // MARK: - Refresh
    func didLoadData() {
        self.loader.stopAnimating()
        
        if let viewController = R.storyboard.pokemons.pokemonsNavigationViewController() {
            viewController.modalPresentationStyle = .fullScreen
            self.present(viewController, animated: true)
        }
    }
}
