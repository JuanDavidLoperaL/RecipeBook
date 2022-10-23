//
//  SearchRecipeViewModelTest.swift
//  RecipeBookTests
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

@testable import RecipeBook
import XCTest

final class SearchRecipeViewModelTest: XCTestCase {

    var viewModel: SearchRecipeViewModel!
    
    override func setUpWithError() throws {
        viewModel = SearchRecipeViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testNavigationTitleComputedProperty() throws {
        XCTAssertEqual(viewModel.navigationTitle, "Buscar Receta")
    }
    
    func testSeeMoreComputedProperty() throws {
        XCTAssertEqual(viewModel.seeMore, "Ver mas")
    }
    
    func testAddFavoriteComputedProperty() throws {
        XCTAssertEqual(viewModel.addFavorite, "Añadir a favoritos")
    }

}
