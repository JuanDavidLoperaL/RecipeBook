//
//  EnvironmentHandle.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation

enum EnvironmentProperty: String {
    case baseURL = "Base_URL"
}

final class EnvConfig {
    static func variable(key: EnvironmentProperty) -> String {
        return Bundle.main.infoDictionary?[key.rawValue] as? String ?? ""
    }
}

