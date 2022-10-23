//
//  UIView+Extension.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import UIKit

public extension UIView {
    func applyStyle(_ backgroundColor: BackgroundColor) {
        self.backgroundColor = backgroundColor.get()
    }
}
