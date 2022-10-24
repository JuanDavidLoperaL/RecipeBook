//
//  SearchRecipeViewModel.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//
import APIManager
import Foundation

final class SearchRecipeViewModel {
    
    // MARK: - Private Properties
    private let api: SearchRecipeAPIProtocol
    private var recipes: [RecipeViewData]
    private var recipeItemsToHave: Int = 0
    private(set) var alertTitle: String = String()
    private(set) var alertMessage: String = String()
    
    // MARK: - Internal Properties
    var currentCell: Int = 0
    
    // MARK: - Delegate
    weak var delegate: SearchRecipeViewControllerDelegate?
    
    // MARK: - Internal Init
    init(api: SearchRecipeAPIProtocol = SearchRecipeAPI()) {
        self.api = api
        recipes = [RecipeViewData]()
    }
    
    // MARK: - Computed Properties
    var navigationTitle: String {
        return "Buscar Receta"
    }
    
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
    
    var seeMore: String {
        return "Ver mas"
    }
    
    func searchRecipe(_ recipeName: String?) {
        guard let recipe: String = recipeName else {
            alertTitle = "Ups..."
            alertMessage = "Algo paso en el sistema y no fue capaz de ser procesado, intentalo de nuevo."
            delegate?.showMessage()
            return
        }
        if recipe.isEmpty {
            alertTitle = "Receta invalida"
            alertMessage = "Debes de digitar el nombre de una receta para que el sistema la pueda buscar."
            delegate?.showMessage()
        } else {
            getRecipePreviews(recipeName: recipe)
        }
    }
    
    func recipeSelected(in cellIndex: Int) {
        delegate?.recipeSelected(recipeViewData: recipes[cellIndex])
    }
    
    func addRemoveFavorite(cellIndex: Int) {
        RealmHandlerSingleton.shared.save(object: recipes[cellIndex]) { didSaveObject in
            if didSaveObject {
                recipes[cellIndex].isFavorite.toggle()
                recipes[cellIndex].favoriteImage = recipes[cellIndex].isFavorite ? "favoriteFilled" : "favorite"
                delegate?.reloadTable()
            } else {
                recipes[cellIndex].isFavorite = false
                alertTitle = "Error"
                alertMessage = "No pudimos añadir a favortios la receta, intentalo de nuevo."
            }
        }
    }
    
    func syncRecipes() {
        if !recipes.isEmpty {
            let recipesSaved = RealmHandlerSingleton.shared.getRecipesSaved()
            for index in 0...recipes.count - 1 {
                if let recoveryObject = recipesSaved.first(where: { $0.id == recipes[index].id}) {
                    recipes[index] = recoveryObject
                }
            }
        }
    }
}

// MARK: - Private Function
extension SearchRecipeViewModel {
    func getRecipePreviews(recipeName: String) {
        delegate?.isLoading(true)
        recipes = [RecipeViewData]()
        api.search(recipe: recipeName) { [weak self] result in
            switch result {
            case .success(let recipePreview):
                self?.recipeItemsToHave = recipePreview.results.count + (self?.recipes.count ?? 0)
                recipePreview.results.forEach { recipePreview in
                    let recipeId: String = String(recipePreview.id)
                    self?.getRecipeDetail(recipeId: recipeId)
                }
            case .failure(let httpError):
                self?.handleError(httpError: httpError)
            }
        }
    }
    
    func getRecipeDetail(recipeId: String) {
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
                    self?.delegate?.isLoading(false)
                    self?.delegate?.reloadTable()
                }
            case .failure(let httpError):
                self?.handleError(httpError: httpError)
            }
        }
    }
    
    func handleError(httpError: HttpError) {
        delegate?.isLoading(false)
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
        delegate?.showMessage()
    }
}
