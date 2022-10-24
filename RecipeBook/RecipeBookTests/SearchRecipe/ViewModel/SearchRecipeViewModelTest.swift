//
//  SearchRecipeViewModelTest.swift
//  RecipeBookTests
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

@testable import RecipeBook
import XCTest

final class SearchRecipeViewModelTest: XCTestCase {

    var api: SearchRecipeAPIMock!
    var viewModel: SearchRecipeViewModel!
    
    override func setUpWithError() throws {
        api = SearchRecipeAPIMock()
        viewModel = SearchRecipeViewModel(api: api)
        viewModel.delegate = self
    }

    override func tearDownWithError() throws {
        api = nil
        viewModel = nil
    }

    func testNavigationTitleComputedProperty() throws {
        XCTAssertEqual(viewModel.navigationTitle, "Buscar Receta")
    }
    
    func testSeeMoreComputedProperty() throws {
        XCTAssertEqual(viewModel.seeMore, "Ver mas")
    }

    func testSearchRecipeWitNilValue() {
        viewModel.searchRecipe(nil)
        XCTAssertEqual(viewModel.alertTitle, "Ups...")
        XCTAssertEqual(viewModel.alertMessage, "Algo paso en el sistema y no fue capaz de ser procesado, intentalo de nuevo.")
    }
    
    func testSearchRecipeWitEmptyValue() {
        viewModel.searchRecipe(String())
        XCTAssertEqual(viewModel.alertTitle, "Receta invalida")
        XCTAssertEqual(viewModel.alertMessage, "Debes de digitar el nombre de una receta para que el sistema la pueda buscar.")
    }
    
    func testSearchRecipeWitSomeValue() {
        XCTAssertEqual(viewModel.numberOfRow, 0)
        viewModel.searchRecipe("Bandeja paisa")
        XCTAssertEqual(viewModel.numberOfRow, 11)
    }
    
    func testRecipeSelected() {
        viewModel.searchRecipe("Something")
        viewModel.recipeSelected(in: 0)
    }
}

extension SearchRecipeViewModelTest: SearchRecipeViewControllerDelegate {
    func showMessage() {}
    
    func reloadTable() {}
    
    func recipeSelected(recipeViewData: RecipeViewData) {
        XCTAssertEqual(recipeViewData.id, 0)
        XCTAssertEqual(recipeViewData.title, "Recipe")
        XCTAssertEqual(recipeViewData.image, "recipe.png")
        XCTAssertEqual(recipeViewData.preparationTime, "Tiempo de preparación 10 min.")
        XCTAssertEqual(recipeViewData.servings, "Sirve 2 persona(s)")
        XCTAssertEqual(recipeViewData.summary, "Resumen: \nrecipe is the best recipe in all the work")
        XCTAssertEqual(recipeViewData.isFavorite, false)
        XCTAssertEqual(recipeViewData.favoriteImage, "favorite")
    }
    
    func isLoading(_ isloading: Bool) {}
}
