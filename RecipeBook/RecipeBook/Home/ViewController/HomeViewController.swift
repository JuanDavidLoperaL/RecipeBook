//
//  HomeViewController.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import DesignSystem
import UIKit

protocol HomeViewControllerDelegate: AnyObject {
    func recipeSelected(recipeViewData: RecipeViewData)
    func reloadTable()
    func addFavoriteFail()
    func isLoading(_ isloading: Bool)
}

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
        baseView.delegate = self
        viewModel.delegate = self
        viewModel.getRecipes { [weak self] recipesLoaded in
            DispatchQueue.main.async {
                if recipesLoaded {
                    self?.viewModel.syncRecipes()
                    self?.baseView.set(viewModel: self?.viewModel ?? HomeViewModel())
                } else {
                    let okAction: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    self?.showAlert(title: self?.viewModel.alertTitle ?? "Error",
                                    message: self?.viewModel.alertMessage ?? "Error generico",
                                    actions: [okAction])
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
        viewModel.syncRecipes()
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
        coordinator.navigateToSearchRecipe()
    }
}

// MARK: - HomeViewController Delegate Implementation
extension HomeViewController: HomeViewControllerDelegate {
    func recipeSelected(recipeViewData: RecipeViewData) {
        print("calling coordinator")
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
    
    func reloadTable() {
        baseView.reloadTable()
    }
    
    func addFavoriteFail() {
        let okAction: UIAlertAction = UIAlertAction(title: "OK",
                                                    style: .default,
                                                    handler: nil)
        showAlert(title: viewModel.alertTitle, message: viewModel.alertMessage, actions: [okAction])
    }
}

// MARK: - HomeView Delegate Implementation
extension HomeViewController: HomeViewDelegate {
    func favoriteRecipesTapped() {
        let favoriteRecipes: [RecipeViewData] = viewModel.getFavoriteRecipes()
        if favoriteRecipes.isEmpty {
            let okAction: UIAlertAction = UIAlertAction(title: "OK",
                                                        style: .default,
                                                        handler: nil)
            showAlert(title: viewModel.alertTitle,
                      message: viewModel.alertMessage,
                      actions: [okAction])
        } else {
            coordinator.navigateToFavoriteRecipes(recipeViewData: favoriteRecipes)
        }
    }
}
