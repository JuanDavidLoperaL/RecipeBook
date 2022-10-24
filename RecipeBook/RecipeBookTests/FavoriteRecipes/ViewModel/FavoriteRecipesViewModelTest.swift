//
//  FavoriteRecipesViewModelTest.swift
//  RecipeBookTests
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

@testable import RecipeBook
import XCTest

final class FavoriteRecipesViewModelTest: XCTestCase {

    var viewModel: FavoriteRecipesViewModel!
    
    override func setUpWithError() throws {
        viewModel = FavoriteRecipesViewModel(favoriteRecipes: [RecipeViewData(id: 0, title: "Bandeja", image: "bandeja.png", preparationTime: "1h", servings: "2p", summary: "bandeja resumen", isFavorite: true, favoriteImage: "")])
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testNavigationTitleComputedProperty() throws {
        XCTAssertEqual(viewModel.navigationTitle, "Favorite Recipes")
    }

    func testViewDataComputedProperty() {
        XCTAssertEqual(viewModel.viewData.id, 0)
        XCTAssertEqual(viewModel.viewData.title, "Bandeja")
        XCTAssertEqual(viewModel.viewData.image, "bandeja.png")
        XCTAssertEqual(viewModel.viewData.preparationTime, "1h")
        XCTAssertEqual(viewModel.viewData.servings, "2p")
        XCTAssertEqual(viewModel.viewData.summary, "bandeja resumen")
        XCTAssertEqual(viewModel.viewData.isFavorite, true)
        XCTAssertEqual(viewModel.viewData.favoriteImage, "")
    }
    
    func testNumberOfRowComputedProperty() {
        XCTAssertEqual(viewModel.numberOfRow, 1)
    }
}
