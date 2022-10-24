//
//  SearchRecipeAPI.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 24/10/22.
//

import APIManager
import Foundation

protocol SearchRecipeAPIProtocol {
    func search(recipe: String, callback: @escaping(Result<RecipePreview, HttpError>) -> Void)
    func getRecipeDetail(recipeId: String, callback: @escaping(Result<Recipe, HttpError>) -> Void)
}

final class SearchRecipeAPI: SearchRecipeAPIProtocol {
    
    enum EndPoint: String {
        case recipe = "/recipes/complexSearch"
        case recipeDetail = "/recipes/*id*/information"
    }
    
    // MARK: - Private Properties
    private let apimanager: APIManager
    
    // MARK: - Internal Init
    init(apiManager: APIManager = APIManager()) {
        self.apimanager = apiManager
    }
    
    func search(recipe: String, callback: @escaping(Result<RecipePreview, HttpError>) -> Void) {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "query", value: recipe),
            URLQueryItem(name: "number", value: "5")
        ]
        apimanager.request(with: "https",
                           host: EnvConfig.variable(key: EnvironmentProperty.baseURL),
                           path: EndPoint.recipe.rawValue,
                           queryItems: queryItems,
                           completion: callback)
    }
    
    func getRecipeDetail(recipeId: String, callback: @escaping(Result<Recipe, HttpError>) -> Void) {
        let endpoint: String = EndPoint.recipeDetail.rawValue.replacingOccurrences(of: "*id*", with: recipeId)
        apimanager.request(with: "https",
                           host: EnvConfig.variable(key: EnvironmentProperty.baseURL),
                           path: endpoint,
                           completion: callback)
    }
}
