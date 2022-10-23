//
//  ButtonStyle.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import UIKit

public enum ButtonStyle {

    struct Configuration {
        let font: UIFont
        let textColor: TextColor
        let alignment: NSTextAlignment
        let backgroundColor: ButtonColor
        let cornerRadius: CGFloat
        let borderColor: ButtonColor
        let borderWidth: CGFloat
    }

    case primaryBtn
    case secondaryBtn
    case link

    func getConfiguration() -> Configuration {
        switch self {
        case .primaryBtn:
            return Configuration(font: .systemFont(ofSize: 15, weight: .medium),
                                 textColor: .white,
                                 alignment: .center,
                                 backgroundColor: .primary,
                                 cornerRadius: 10.0,
                                 borderColor: .clear,
                                 borderWidth: 0.0)
        case .secondaryBtn:
            return Configuration(font: .systemFont(ofSize: 15, weight: .medium),
                                 textColor: .buttonSecondary,
                                 alignment: .center,
                                 backgroundColor: .clear,
                                 cornerRadius: 10.0,
                                 borderColor: .secondary,
                                 borderWidth: 1.5)
        case .link:
            return Configuration(font: .systemFont(ofSize: 15, weight: .medium),
                                 textColor: .buttonSecondary,
                                 alignment: .center,
                                 backgroundColor: .clear,
                                 cornerRadius: 10.0,
                                 borderColor: .clear,
                                 borderWidth: 0.0)
        }
    }
}
