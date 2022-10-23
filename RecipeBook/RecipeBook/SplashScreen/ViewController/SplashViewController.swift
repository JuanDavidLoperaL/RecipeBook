//
//  SplashViewController.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import Lottie
import UIKit

final class SplashViewController: UIViewController {

    // MARK: - Private UI Properties
    private let baseView: SplashView = SplashView()
    
    // MARK: - Private Properties
    private let coordinator: RecipesCoordinator
    
    // MARK: - Internal Init
    init(coordinator: RecipesCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life cycle
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.delegate = self
    }
}

// MARK: - SplashView Delegate Implementation
extension SplashViewController: SplashViewDelegate {
    func animationHasFinished() {
        coordinator.navigateToHome()
    }
}
