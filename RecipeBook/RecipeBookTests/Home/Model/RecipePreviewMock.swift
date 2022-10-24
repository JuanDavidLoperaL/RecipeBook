//
//  RecipePreviewMock.swift
//  RecipeBookTests
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

@testable import RecipeBook

extension RecipePreview {
    static func mock() -> RecipePreview {
        return RecipePreview(results: RecipePreviewResult.mock())
    }
}

