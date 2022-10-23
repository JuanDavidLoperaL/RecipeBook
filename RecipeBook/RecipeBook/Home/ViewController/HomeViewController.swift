//
//  HomeViewController.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let baseView: HomeView = HomeView()
    
    // MARK: - Private Properties
    private let coordinator: RecipesCoordinator
    private let viewModel: HomeViewModel
    
    // MARK: - Internal Init
    init(coordinator: RecipesCoordinator, viewModel: HomeViewModel = HomeViewModel()) {
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
private extension HomeViewController {
    func setupNavigationBar() {
        self.title = viewModel.navigationTitle
        self.navigationItem.setHidesBackButton(true, animated: true)
        let searchButton: UIBarButtonItem = UIBarButtonItem(title: viewModel.searchTitle,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(searchAction))
        searchButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = searchButton
    }
    
    @objc
    func searchAction() {
        print("Buscando")
    }
}
