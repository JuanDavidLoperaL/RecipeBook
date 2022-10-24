//
//  SearchRecipeAPIMock.swift
//  RecipeBookTests
//
//  Created by Juan david Lopera lopez on 24/10/22.
//

import APIManager
import Foundation

@testable import RecipeBook

final class SearchRecipeAPIMock: SearchRecipeAPIProtocol {
    
    var shouldFail: Bool = false
    
    func search(recipe: String, callback: @escaping (Result<RecipePreview, HttpError>) -> Void) {
        if shouldFail {
            callback(.failure(HttpError.badRequest))
        } else {
            callback(.success(RecipePreview.mock()))
        }
    }
    
    func getRecipeDetail(recipeId: String, callback: @escaping (Result<Recipe, HttpError>) -> Void) {
        if shouldFail {
            callback(.failure(HttpError.badRequest))
        } else {
            callback(.success(Recipe.mock()))
        }
    }
}
