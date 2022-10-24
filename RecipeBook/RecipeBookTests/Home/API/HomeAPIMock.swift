//
//  HomeAPIMock.swift
//  RecipeBookTests
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

@testable import RecipeBook
import APIManager

final class HomeAPIMock: HomeAPIProtocol {
    
    var shouldFail: Bool = false
    
    func getRecipesPreview(offset: String, number: String, callback: @escaping (Result<RecipePreview, HttpError>) -> Void) {
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
