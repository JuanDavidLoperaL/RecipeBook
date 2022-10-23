//
//  UIButton+Extension.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import UIKit

public extension UIButton {
    func applyStyle(_ buttonStyle: ButtonStyle) {
        let configuration: ButtonStyle.Configuration = buttonStyle.getConfiguration()
        self.backgroundColor = configuration.backgroundColor.get()
        self.layer.cornerRadius = configuration.cornerRadius
        self.layer.borderColor = configuration.borderColor.get().cgColor
        self.layer.borderWidth = configuration.borderWidth
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.setTitleColor(configuration.textColor.get(), for: .normal)
        let attributedText: NSAttributedString = NSAttributedString(string: self.titleLabel?.text ?? "", attributes: [NSAttributedString.Key.font: configuration.font])
        self.setAttributedTitle(attributedText, for: .normal)
    }
}
