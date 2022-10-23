//
//  HomeViewModelTest.swift
//  RecipeBookTests
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

@testable import RecipeBook
import XCTest

final class HomeViewModelTest: XCTestCase {

    var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        viewModel = HomeViewModel()
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

}
