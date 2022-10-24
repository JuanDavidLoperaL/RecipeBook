//
//  HomeViewModelTest.swift
//  RecipeBookTests
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

@testable import RecipeBook
import XCTest

final class HomeViewModelTest: XCTestCase {

    var api: HomeAPIMock!
    var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        api = HomeAPIMock()
        viewModel = HomeViewModel(api: api)
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testNavigationTitleComputedProperty() throws {
        XCTAssertEqual(viewModel.navigationTitle, "Home")
    }
    
    func testSearchTitleComputedProperty() throws {
        XCTAssertEqual(viewModel.searchTitle, "Buscar")
    }

    func testGetRecipesWithSuccess() {
        api.shouldFail = false
        viewModel.getRecipes { [self] recipesLoaded in
            XCTAssertTrue(recipesLoaded)
            XCTAssertEqual(viewModel.numberOfRow, 10)
            viewModel.currentCell = 2
            XCTAssertEqual(viewModel.viewData.id, 0)
            XCTAssertEqual(viewModel.viewData.title, "Recipe")
            XCTAssertEqual(viewModel.viewData.preparationTime, "Tiempo de preparación 10 min.")
            XCTAssertEqual(viewModel.viewData.servings, "Sirve 2 persona(s)")
        }
    }
}
