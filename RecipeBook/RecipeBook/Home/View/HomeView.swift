//
//  HomeView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import DesignSystem
import Foundation
import UIKit

final class HomeView: UIView {
    
    // MARK: - Private UI Properties
    private let recipesTableView: UITableView = {
        let table: UITableView = UITableView()
        table.tableFooterView = UIView()
        table.applyStyle(.primary)
        return table
    }()
    
    // MARK: - Internal Init
    init() {
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
    }
    
    func viewConstraints() {
        recipesTableView.layout.makeConstraints { view in
            view.constraintToSuperview()
        }
    }
    
    func viewExtraConfiguration() {
        self.applyStyle(.primary)
    }
}
