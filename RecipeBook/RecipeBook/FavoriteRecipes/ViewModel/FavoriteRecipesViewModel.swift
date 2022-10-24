//
//  FavoriteRecipesViewModel.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation

final class FavoriteRecipesViewModel {
    
    // MARK: - Private Properties
    let favoriteRecipes: [RecipeViewData]
    
    // MARK: - Internal Properties
    var currentCell: Int = 0
    
    // MARK: - Internal Init
    init(favoriteRecipes: [RecipeViewData] = [RecipeViewData]()) {
        self.favoriteRecipes = favoriteRecipes
    }
    
    // MARK: - Computed Properties
    var numberOfRow: Int {
        return favoriteRecipes.count
    }
    
    var navigationTitle: String {
        return "Favorite Recipes"
    }
    
    var viewData: RecipeViewData {
        guard favoriteRecipes.indices.contains(currentCell) else {
            return RecipeViewData(id: 0,
                                  title: String(),
                                  image: String(),
                                  preparationTime: String(),
                                  servings: String(),
                                  summary: String(),
                                  isFavorite: false,
                                  favoriteImage: String())
        }
        return favoriteRecipes[currentCell]
    }
}
