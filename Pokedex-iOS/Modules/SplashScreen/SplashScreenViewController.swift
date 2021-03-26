//
//  SplashScreenViewController.swift
//  Tour de France
//
//  Created by Michael Coqueret on 15/03/2021.
//  Copyright © 2021 L'Équipe. All rights reserved.
//

class SplashScreenViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var loader: UIActivityIndicatorView! {
        didSet {
            self.loader.startAnimating()
        }
    }

    // MARK: - Variables
    private lazy var interactor: SplashScreenInteractor = {
        SplashScreenInteractor(with: self)
    }()

    // MARK: - View life cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.interactor.refreshAllData()
    }

    // MARK: - Refresh
    func loadingData() {
        log(.debug, "SplashScreenViewController ~> Loading Data")
    }

    func didLoadData() {
        log(.debug, "SplashScreenViewController ~> Did load data")

        // TODO: Remove DispatchQueue
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            if let viewController = R.storyboard.pokemons.pokemonsNavigationViewController() {
                viewController.modalPresentationStyle = .fullScreen
                self?.present(viewController, animated: true)
            }
        }
    }
}
