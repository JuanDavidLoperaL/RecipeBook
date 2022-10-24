//
//  SearchRecipeViewController.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import UIKit

protocol SearchRecipeViewControllerDelegate: AnyObject {
    func showMessage()
    func reloadTable()
    func recipeSelected(recipeViewData: RecipeViewData)
    func isLoading(_ isloading: Bool)
}

final class SearchRecipeViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let baseView: SearchRecipeView = SearchRecipeView()
    
    // MARK: - Private Properties
    private let coordinator: RecipesCoordinator
    private let viewModel: SearchRecipeViewModel
    
    // MARK: - Internal Init
    init(coordinator: RecipesCoordinator,
         viewModel: SearchRecipeViewModel = SearchRecipeViewModel()) {
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
        viewModel.delegate = self
        baseView.set(viewModel: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
}

// MARK: - Private Functions
private extension SearchRecipeViewController {
    func setupNavigationBar() {
        self.title = viewModel.navigationTitle
        self.navigationItem.setHidesBackButton(false, animated: true)
        self.navigationController?.customBackButton()
    }
}

// MARK: - SearchRecipeViewController Delegate Implementation
extension SearchRecipeViewController: SearchRecipeViewControllerDelegate {
    
    func recipeSelected(recipeViewData: RecipeViewData) {
        coordinator.navigateToDetail(recipeViewData: recipeViewData)
    }
    
    func showMessage() {
        let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        showAlert(title: viewModel.alertTitle, message: viewModel.alertMessage, actions: [okAction])
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.viewModel.syncRecipes()
            self.baseView.reloadTable()
        }
    }
    
    func isLoading(_ isloading: Bool) {
        DispatchQueue.main.async {
            if isloading {
                self.showLoading()
            } else {
                self.hideLoading()
            }
        }
    }
}
