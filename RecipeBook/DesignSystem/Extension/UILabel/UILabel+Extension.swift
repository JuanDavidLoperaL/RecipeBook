//
//  UILabel+Extension.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import UIKit

extension UILabel {
    public func applyStyle(_ style: TextStyle) {
        let configuration = style.getConfiguration()
        self.font = configuration.font
        self.textAlignment = configuration.alignment
        self.textColor = configuration.textColor.get()
    }
}
