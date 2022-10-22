//
//  TextColor.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import UIKit

fileprivate let chalkBlack: UIColor = UIColor(red: 38/255, green: 36/255, blue: 27/255, alpha: 1.0)
fileprivate let transparentBlack: UIColor = UIColor(red: 39/255, green: 39/255, blue: 39/255, alpha: 1.0)

public enum TextColor {
    case primary
    case secondary
    
    func get() -> UIColor {
        switch self {
        case .primary:
            return chalkBlack
        case .secondary:
            return transparentBlack
        }
    }
}
