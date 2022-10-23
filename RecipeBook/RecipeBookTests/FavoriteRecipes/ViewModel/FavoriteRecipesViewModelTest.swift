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
        viewModel = FavoriteRecipesViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testNavigationTitleComputedProperty() throws {
        XCTAssertEqual(viewModel.navigationTitle, "Favorite Recipes")
    }

}
