//
//  HomeView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import DesignSystem
import UIKit

protocol HomeViewDelegate: AnyObject {
    func favoriteRecipesTapped()
}

final class HomeView: UIView {
    
    // MARK: - Private UI Properties
    private let recipesTableView: UITableView = {
        let table: UITableView = UITableView()
        table.tableFooterView = UIView()
        table.applyStyle(.primary)
        table.register(RecipeTableViewCell.self)
        return table
    }()
    
    private let favoriteRecipesButton: UIButton = {
        let button: UIButton = UIButton()
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(favoriteRecipesAction), for: .touchDown)
        return button
    }()
    
    // MARK: - Private Properties
    private let datasourceTable: DatasourceRecipeTable
    private let delegateTable: DelegateRecipeTable
    
    // MARK: - Delegate
    weak var delegate: HomeViewDelegate?
    
    // MARK: - Internal Init
    init() {
        datasourceTable = DatasourceRecipeTable()
        delegateTable = DelegateRecipeTable()
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - ViewCode Configuration
extension HomeView: ViewConfigurationProtocol {
    func viewHierarchy() {
        addSubview(recipesTableView)
        addSubview(favoriteRecipesButton)
    }
    
    func viewConstraints() {
        favoriteRecipesButton.layout.makeConstraints { view in
            view.bottomAnchor(toItem: self, toItemAttribute: .bottomMargin, constant: -20.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 50.0)
        }
        
        recipesTableView.layout.makeConstraints { view in
            view.topAnchor(toItem: self, toItemAttribute: .topMargin)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing)
            view.bottomAnchor(toItem: favoriteRecipesButton, toItemAttribute: .top, constant: -10.0)
        }
    }
    
    func viewExtraConfiguration() {
        self.applyStyle(.primary)
    }
}

// MARK: - Internal Function
extension HomeView {
    func set(viewModel: HomeViewModel) {
        recipesTableView.dataSource = datasourceTable
        recipesTableView.delegate = delegateTable
        recipesTableView.reloadData()
    }
}

// MARK: - Private Functions
private extension HomeView {
    @objc
    func favoriteRecipesAction() {
        delegate?.favoriteRecipesTapped()
    }
}
