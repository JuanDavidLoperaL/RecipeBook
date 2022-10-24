//
//  DelegateSearchRecipeTable.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 24/10/22.
//

import UIKit

final class DelegateSearchRecipeTable: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
