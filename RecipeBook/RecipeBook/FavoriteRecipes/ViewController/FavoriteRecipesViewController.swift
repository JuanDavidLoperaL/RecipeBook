//
//  FavoriteRecipesViewController.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import DesignSystem
import UIKit

final class FavoriteRecipesViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let baseView: FavoriteRecipesView = FavoriteRecipesView()
    
    // MARK: - Private Properties
    private let coordinator: RecipesCoordinator
    private let viewModel: FavoriteRecipesViewModel
    
    // MARK: - Internal Init
    init(coordinator: RecipesCoordinator,
         viewModel: FavoriteRecipesViewModel = FavoriteRecipesViewModel()) {
        self.coordinator = coordinator
        self.viewModel = viewModel
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
        baseView.set(viewModel: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
}

// MARK: - Private Functions
private extension FavoriteRecipesViewController {
    func setupNavigationBar() {
        self.title = viewModel.navigationTitle
        self.navigationItem.setHidesBackButton(false, animated: true)
        self.navigationController?.customBackButton()
    }
}
