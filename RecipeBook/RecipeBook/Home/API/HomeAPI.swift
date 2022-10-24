//
//  HomeAPI.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import APIManager
import Foundation

protocol HomeAPIProtocol {
    func getRecipesPreview(offset: String, number: String, callback: @escaping(Result<RecipePreview, HttpError>) -> Void)
    func getRecipeDetail(recipeId: String, callback: @escaping(Result<Recipe, HttpError>) -> Void)
}

final class HomeAPI: HomeAPIProtocol {
    
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
    
    func getRecipesPreview(offset: String, number: String, callback: @escaping(Result<RecipePreview, HttpError>) -> Void) {
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "offset", value: offset),
            URLQueryItem(name: "number", value: number),
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
