//
//  ButtonColor.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import UIKit

let tulip: UIColor = UIColor(red: 225/255, green: 135/255, blue: 135/255, alpha: 1.0)
let lightCarminePink: UIColor = UIColor(red: 226/255, green: 104/255, blue: 104/255, alpha: 1.0)

public enum ButtonColor {
    case primary
    case secondary
    case clear

    func get() -> UIColor {
        switch self {
        case .primary:
            return tulip
        case .secondary:
            return lightCarminePink
        case .clear:
            return .clear
        }
    }
}


