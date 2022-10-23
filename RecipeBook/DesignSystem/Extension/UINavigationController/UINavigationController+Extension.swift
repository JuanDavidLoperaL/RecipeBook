//
//  UINavigationController+Extension.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import UIKit

public extension UINavigationController {
    func customBackButton(title: String = String()) {
        let backButton = UIBarButtonItem()
        backButton.title = title
        backButton.tintColor = .black
        self.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
