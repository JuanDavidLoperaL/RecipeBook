//
//  DatasourceRecipeTable.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import UIKit

final class DatasourceRecipeTable: NSObject, UITableViewDataSource {
    
    var viewModel: HomeViewModel = HomeViewModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: RecipeTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        viewModel.currentCell = indexPath.row
        cell.set(viewModel: viewModel, cellIndex: indexPath.row)
        return cell
    }
}
