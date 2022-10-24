//
//  RecipePreviewResultMock.swift
//  RecipeBookTests
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

@testable import RecipeBook

extension RecipePreviewResult {
    static func mock() -> [RecipePreviewResult] {
        return [
            RecipePreviewResult(id: 0, title: "Bandeja Paisa", image: "bandejaPaisa.png"),
            RecipePreviewResult(id: 1, title: "Ajiaco", image: "ajiaco.png"),
            RecipePreviewResult(id: 2, title: "Tacos", image: "tacos.png"),
            RecipePreviewResult(id: 3, title: "Empandas", image: "empanadas.png"),
            RecipePreviewResult(id: 4, title: "Papas", image: "papas.png"),
            RecipePreviewResult(id: 5, title: "Hamburguesa", image: "Hamburguesa.png"),
            RecipePreviewResult(id: 6, title: "Pizza", image: "pizza.png"),
            RecipePreviewResult(id: 7, title: "Sopa", image: "sopa.png"),
            RecipePreviewResult(id: 8, title: "Sancocho", image: "sancocho.png"),
            RecipePreviewResult(id: 9, title: "Frijoles", image: "frijoles.png"),
            RecipePreviewResult(id: 10, title: "Huevo revueltos", image: "huevosRevueltos.png")
        ]
    }
}
