//
//  RecipeViewData.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation
import RealmSwift

class RecipeViewData: Object {
    @Persisted var id: Int
    @Persisted var title: String
    @Persisted var image: String
    @Persisted var preparationTime: String
    @Persisted var servings: String
    @Persisted var summary: String
    @Persisted var isFavorite: Bool
    @Persisted var favoriteImage: String
    
    init(id: Int, title: String, image: String, preparationTime: String, servings: String, summary: String, isFavorite: Bool, favoriteImage: String) {
        self.id = id
        self.title = title
        self.image = image
        self.preparationTime = preparationTime
        self.servings = servings
        self.summary = summary
        self.isFavorite = isFavorite
        self.favoriteImage = favoriteImage
    }
    
    override init() {
        id = 0
        title = String()
        image = String()
        preparationTime = String()
        servings = String()
        summary = String()
        favoriteImage = String()
        isFavorite = false
    }
}
