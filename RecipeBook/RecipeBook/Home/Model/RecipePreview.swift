//
//  RecipePreview.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation

struct RecipePreview: Codable {
    let results: [RecipePreviewResult]
}

struct RecipePreviewResult: Codable {
    let id: Int
    let title: String
    let image: String
}
