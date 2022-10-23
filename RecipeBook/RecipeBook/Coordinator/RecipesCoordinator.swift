//
//  RecipesCoordinator.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import UIKit

final class RecipesCoordinator {
    
    // MARK: - Private Properties
    private var navigationController: UINavigationController

    // MARK: - Internal Init
    init() {
        self.navigationController = UINavigationController()
    }

    // MARK: - Internal Functions
    func start() -> UINavigationController {
        let viewController: SplashViewController = SplashViewController(coordinator: self)
        self.navigationController.setViewControllers([viewController], animated: true)
        return navigationController
    }
    
    func navigateToHome() {
        let homeViewController: HomeViewController = HomeViewController(coordinator: self)
        self.navigationController.pushViewController(homeViewController, animated: true)
    }
}
