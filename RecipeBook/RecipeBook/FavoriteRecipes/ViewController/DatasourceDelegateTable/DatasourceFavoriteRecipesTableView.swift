//
//  DatasourceFavoriteRecipesTableView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import DesignSystem
import UIKit

final class DatasourceFavoriteRecipesTableView: NSObject, UITableViewDataSource {
    
    var viewModel: FavoriteRecipesViewModel = FavoriteRecipesViewModel()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FavoriteRecipesCell = tableView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel)
        return cell
    }
}
