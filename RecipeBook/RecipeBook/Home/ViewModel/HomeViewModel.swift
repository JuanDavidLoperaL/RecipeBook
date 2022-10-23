//
//  HomeViewModel.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import Foundation

final class HomeViewModel {
    
    // MARK: - Computed Properties
    var numberOfRow: Int {
        return 5
    }
    
    var navigationTitle: String {
        return "Home"
    }
    
    var searchTitle: String {
        return "Buscar"
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
        return "favorite"
    }
}
