//
//  DelegateFavoriteRecipesTableView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation
import UIKit

final class DelegateFavoriteRecipesTableView: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
