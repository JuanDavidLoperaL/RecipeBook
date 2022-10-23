//
//  TextColor.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import UIKit

let chalkBlack: UIColor = UIColor(red: 38/255, green: 36/255, blue: 27/255, alpha: 1.0)
let transparentBlack: UIColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1.0)

public enum TextColor {
    case primary
    case secondary
    case white
    case buttonSecondary
    
    func get() -> UIColor {
        switch self {
        case .primary:
            return chalkBlack
        case .secondary:
            return transparentBlack
        case .white:
            return .white
        case .buttonSecondary:
            return lightCarminePink
        }
    }
}
