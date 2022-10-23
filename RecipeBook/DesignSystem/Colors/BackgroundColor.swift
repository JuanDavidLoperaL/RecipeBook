//
//  BackgroundColor.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import UIKit

let timberwolf: UIColor = UIColor(red: 216/255, green: 217/255, blue: 207/255, alpha: 1.0)
let brightGray: UIColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1.0)

public enum BackgroundColor {
    case primary
    case secondary

    func get() -> UIColor {
        switch self {
        case .primary:
            return timberwolf
        case .secondary:
            return brightGray
        }
    }
}
