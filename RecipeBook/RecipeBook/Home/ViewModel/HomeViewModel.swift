//
//  HomeViewModel.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import Foundation
import APIManager

final class HomeViewModel {
    
    // MARK: - Private Properties
    private var offsetRequest: Int = 0
    private var numberRecipeInRequest: Int = 10
    private let api: HomeAPIProtocol
    private var recipes: [RecipeViewData]
    private var recipeItemsToHave: Int = 0
    private(set) var alertTitle: String = String()
    private(set) var alertMessage: String = String()
    
    // MARK: - Internal Properties
    var currentCell: Int = 0
    
    // MARK: - Delegate
    weak var delegate: HomeViewControllerDelegate?
    
    // MARK: - Internal Init
    init(api: HomeAPIProtocol = HomeAPI()) {
        self.api = api
        offsetRequest = 0
        numberRecipeInRequest = 10
        recipes = [RecipeViewData]()
    }
    
    // MARK: - Computed Properties
    var numberOfRow: Int {
        return recipes.count
    }
    
    var viewData: RecipeViewData {
        guard recipes.indices.contains(currentCell) else {
            return RecipeViewData(id: 0,
                                  title: String(),
                                  image: String(),
                                  preparationTime: String(),
                                  servings: String(),
                                  summary: String(),
                                  isFavorite: false,
                                  favoriteImage: String())
        }
        return recipes[currentCell]
    }
    
    var navigationTitle: String {
        return "Home"
    }
    
    var searchTitle: String {
        return "Buscar"
    }
}

// MARK: - Internal Functions
extension HomeViewModel {
    func recipeSelected(in cellIndex: Int) {
        delegate?.recipeSelected(recipeViewData: recipes[cellIndex])
    }
    
    func addRemoveFavorite(cellIndex: Int) {
        recipes[cellIndex].isFavorite.toggle()
        recipes[cellIndex].favoriteImage = recipes[cellIndex].isFavorite ? "favoriteFilled" : "favorite"
        delegate?.reloadTable()
    }
    
    func getFavoriteRecipes() -> [RecipeViewData] {
        let favoritesRecipes: [RecipeViewData] = recipes.filter { recipeViewData in
            return recipeViewData.isFavorite
        }
        if favoritesRecipes.isEmpty {
            alertTitle = "Sin Favoritos"
            alertMessage = "No tienes recetas favoritas, animate a adicionar algunas recetas a favoritos para que luego puedas entrar en esta sección, recuerda, es solo darle un toque al corazón que se encuentra al lado arriba-derecho de cada card de recetas."
        }
        return favoritesRecipes
    }
    
    func getRecipes(callback: @escaping(_ recipesLoaded: Bool) -> Void) {
        getRecipePreview(callback: callback)
    }
}

// MARK: - Private Functions
private extension HomeViewModel {
    
    func getRecipePreview(callback: @escaping(_ recipesLoaded: Bool) -> Void) {
        let offsetStr: String = String(offsetRequest)
        let numberStr: String = String(numberRecipeInRequest)
        recipeItemsToHave = recipeItemsToHave + numberRecipeInRequest
        api.getRecipesPreview(offset: offsetStr, number: numberStr) { [weak self] result in
            switch result {
            case .success(let recipePreview):
                recipePreview.results.forEach { recipePreview in
                    let recipeId: String = String(recipePreview.id)
                    self?.getRecipeDetail(recipeId: recipeId, callback: callback)
                }
            case .failure(let httpError):
                self?.handleError(httpError: httpError, callback: callback)
            }
        }
    }
    
    func getRecipeDetail(recipeId: String, callback: @escaping(_ recipesLoaded: Bool) -> Void) {
        api.getRecipeDetail(recipeId: recipeId) { [weak self] result in
            switch result {
            case .success(let recipe):
                let preparationTime: String = String(recipe.readyInMinutes)
                let servings: String = String(recipe.servings)
                let recipeViewData: RecipeViewData = RecipeViewData(id: recipe.id,
                                                                    title: recipe.title,
                                                                    image: recipe.image,
                                                                    preparationTime: "Tiempo de preparación \(preparationTime) min.",
                                                                    servings: "Sirve \(servings) persona(s)",
                                                                    summary: "Resumen: \n\(recipe.summary)",
                                                                    isFavorite: false,
                                                                    favoriteImage: "favorite")
                self?.recipes.append(recipeViewData)
                let recipesItems: Int = self?.recipes.count ?? 0
                if recipesItems == self?.recipeItemsToHave {
                    callback(true)
                }
            case .failure(let httpError):
                self?.handleError(httpError: httpError, callback: callback)
            }
        }
    }
    
    func handleError(httpError: HttpError, callback: @escaping(_ recipesLoaded: Bool) -> Void) {
        switch httpError {
        case .badRequest, .unauthorized, .forbidden, .notFound:
            alertTitle = "Ups..."
            alertMessage = "Lo siento, parece que ocurrio un error al momento de obtener los datos, si el problema persiste entonces comunicate a este email juandavidl2011.jdll@gmail.com"
        case .serverError, .serviceUnavailable:
            alertTitle = "Servidor down"
            alertMessage = "Lo siento, parece que ocurrio un error al momento de obtener los datos, vamos a trabajar para restablecer los servicios lo mas rapido posible, si el problema persiste entonces comunicate a este email juandavidl2011.jdll@gmail.com"
        case .genericError(let value):
            alertTitle = "Ups..."
            alertMessage = "Lo siento, parece que ocurrio un error al momento de obtener los datos, el error es el \(value)\nvamos a trabajar para solucionar este problema lo mas rapido posible, si el problema persiste entonces comunicate a este email juandavidl2011.jdll@gmail.com"
        }
        recipes = [RecipeViewData]()
        callback(false)
    }
}
