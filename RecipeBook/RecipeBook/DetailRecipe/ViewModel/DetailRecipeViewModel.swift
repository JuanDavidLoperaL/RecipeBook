//
//  DetailRecipeViewModel.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 24/10/22.
//

import Foundation

final class DetailRecipeViewModel {
    
    // MARK: - Private Properties
    private(set) var viewData: RecipeViewData
    private(set) var alertTitle: String = String()
    private(set) var alertMessage: String = String()
    
    // MARK: - Internal Init
    init(recipeViewData: RecipeViewData) {
        viewData = recipeViewData
    }
    
    // MARK: - Computed Properties
    var navigationTitle: String {
        return "Detalle"
    }
    
    // MARK: - Internal Function
    func addRemoveFavorite() {
        RealmHandlerSingleton.shared.save(object: viewData) { didSaveObject in
            if didSaveObject {
                viewData.isFavorite.toggle()
                viewData.favoriteImage = viewData.isFavorite ? "favoriteFilled" : "favorite"
            } else {
                alertTitle = "Error"
                alertMessage = "No pudimos añadir a favortios la receta, intentalo de nuevo."
            }
        }
    }
}
