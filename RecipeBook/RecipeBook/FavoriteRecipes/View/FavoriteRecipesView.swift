//
//  FavoriteRecipesView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import DesignSystem
import UIKit

final class FavoriteRecipesView: UIView {
    
    // MARK: - Private UI Properties
    private let favoriteRecipesTableView: UITableView = {
        let table: UITableView = UITableView()
        table.tableFooterView = UIView()
        table.applyStyle(.primary)
        table.register(FavoriteRecipesCell.self)
        return table
    }()
    
    // MARK: - Private Properties
    private let datasourceTable: DatasourceFavoriteRecipesTableView
    private let delegateTable: DelegateFavoriteRecipesTableView
    
    // MARK: - Internal Init
    init() {
        datasourceTable = DatasourceFavoriteRecipesTableView()
        delegateTable = DelegateFavoriteRecipesTableView()
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - ViewCode Configuration
extension FavoriteRecipesView: ViewConfigurationProtocol {
    func viewHierarchy() {
        addSubview(favoriteRecipesTableView)
    }
    
    func viewConstraints() {
        favoriteRecipesTableView.layout.makeConstraints { view in
            view.constraintToSuperview()
        }
    }
    
    func viewExtraConfiguration() {
        self.applyStyle(.primary)
    }
}

// MARK: - Internal Function
extension FavoriteRecipesView {
    func set(viewModel: FavoriteRecipesViewModel) {
        datasourceTable.viewModel = viewModel
        favoriteRecipesTableView.dataSource = datasourceTable
        favoriteRecipesTableView.delegate = delegateTable
        favoriteRecipesTableView.reloadData()
    }
}
