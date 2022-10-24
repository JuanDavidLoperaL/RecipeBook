//
//  SearchRecipeView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import DesignSystem
import UIKit

final class SearchRecipeView: UIView {
    
    // MARK: - Private Properties
    private var viewModel: SearchRecipeViewModel?
    
    // MARK: - Private UI Properties
    private let searchTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.placeholder = "Nombre de receta aqui."
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button: UIButton = UIButton()
        button.applyStyle(.primaryBtn)
        button.setTitle("Buscar", for: .normal)
        button.addTarget(self, action: #selector(searchAction), for: .touchDown)
        return button
    }()
    
    private let recipesTableView: UITableView = {
        let table: UITableView = UITableView()
        table.tableFooterView = UIView()
        table.applyStyle(.primary)
        table.register(SearchRecipeCell.self)
        return table
    }()
    
    // MARK: - Private Properties
    private let datasourceTable: DatasourceSearchRecipeTable
    private let delegateTable: DelegateSearchRecipeTable
    
    // MARK: - Internal Init
    init() {
        datasourceTable = DatasourceSearchRecipeTable()
        delegateTable = DelegateSearchRecipeTable()
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode Configuration
extension SearchRecipeView: ViewConfigurationProtocol {
    func viewHierarchy() {
        [searchTextField, searchButton, recipesTableView].forEach { view in
            addSubview(view)
        }
    }
    
    func viewConstraints() {
        searchButton.layout.makeConstraints { view in
            view.topAnchor(toItem: self, toItemAttribute: .topMargin, constant: 30.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.widthAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 70.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 45.0)
        }
        
        searchTextField.layout.makeConstraints { view in
            view.topAnchor(toItem: self, toItemAttribute: .topMargin, constant: 30.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: searchButton, toItemAttribute: .leading, constant: -16.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 45.0)
        }
        
        recipesTableView.layout.makeConstraints { view in
            view.topAnchor(toItem: searchTextField, toItemAttribute: .bottom, constant: 10.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing)
            view.bottomAnchor(toItem: self, toItemAttribute: .bottomMargin, constant: -10.0)
        }
    }
    
    func viewExtraConfiguration() {
        self.applyStyle(.primary)
    }
    
}

// MARK: - Private Functions
private extension SearchRecipeView {
    @objc
    func searchAction() {
        viewModel?.searchRecipe(searchTextField.text)
    }
}

// MARK: - Internal Function
extension SearchRecipeView {
    func set(viewModel: SearchRecipeViewModel) {
        self.viewModel = viewModel
        datasourceTable.viewModel = viewModel
        recipesTableView.dataSource = datasourceTable
        recipesTableView.delegate = delegateTable
        recipesTableView.reloadData()
    }
    
    func reloadTable() {
        recipesTableView.reloadData()
    }
}
