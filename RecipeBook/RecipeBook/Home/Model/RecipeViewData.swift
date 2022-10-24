//
//  RecipeViewData.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation

struct RecipeViewData: Decodable {
    let id: Int
    let title: String
    let image: String
    let preparationTime: String
    let servings: String
    let summary: String
    var isFavorite: Bool
    var favoriteImage: String
}
