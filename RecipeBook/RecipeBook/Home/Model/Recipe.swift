//
//  Recipe.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation

struct Recipe: Decodable {
    let id: Int
    let title: String
    let image: String
    let readyInMinutes: Int
    let servings: Int
    let summary: String
}
