//
//  FavoriteRecipesViewModel.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation

final class FavoriteRecipesViewModel {
    
    // MARK: - Computed Properties
    var numberOfRow: Int {
        return 5
    }
    
    var navigationTitle: String {
        return "Favorite Recipes"
    }
    
    var mainImage: String {
        return "SomeImage"
    }
    
    var recipeTitle: String {
        return "RecipeTitle"
    }
    
    var servings: String {
        return "Servings"
    }
    
    var preparationTime: String {
        return "Preparation time"
    }
    
    var favoriteImage: String {
        return "close"
    }
}
