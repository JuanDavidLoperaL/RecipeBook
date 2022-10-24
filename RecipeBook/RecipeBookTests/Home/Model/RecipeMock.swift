//
//  RecipeMock.swift
//  RecipeBookTests
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

@testable import RecipeBook

extension Recipe {
    static func mock() -> Recipe {
        return Recipe(id: 0, title: "Recipe", image: "recipe.png", readyInMinutes: 10, servings: 2, summary: "recipe is the best recipe in all the work")
    }
}
