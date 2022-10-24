//
//  DatasourceSearchRecipeTable.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 24/10/22.
//

import Foundation

import UIKit

final class DatasourceSearchRecipeTable: NSObject, UITableViewDataSource {
    
    var viewModel: SearchRecipeViewModel = SearchRecipeViewModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchRecipeCell = tableView.dequeueReusableCell(for: indexPath)
        viewModel.currentCell = indexPath.row
        cell.set(viewModel: viewModel, cellIndex: indexPath.row)
        return cell
    }
}
