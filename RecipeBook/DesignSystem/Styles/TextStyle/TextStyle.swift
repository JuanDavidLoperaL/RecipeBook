//
//  TextStyle.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import UIKit

public enum TextStyle {

    struct Configuration {
        let font: UIFont
        let textColor: TextColor
        let alignment: NSTextAlignment
    }

    case headerSplash(alignment: NSTextAlignment)
    case header(alignment: NSTextAlignment)
    case body(alignment: NSTextAlignment)

    func getConfiguration() -> Configuration {
        switch self {
        case let .headerSplash(alignment):
            return Configuration(font: .systemFont(ofSize: 30.0, weight: .bold), textColor: .primary, alignment: alignment)
        case let .header(alignment):
            return Configuration(font: .systemFont(ofSize: 19, weight: .medium), textColor: .primary, alignment: alignment)
        case let .body(alignment):
            return Configuration(font: .systemFont(ofSize: 15, weight: .regular), textColor: .secondary, alignment: alignment)
        }
    }
}
