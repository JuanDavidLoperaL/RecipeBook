//
//  UIViewController.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, message: String, actions: [UIAlertAction]) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { actionAlert in
            alert.addAction(actionAlert)
        }
        self.present(alert, animated: true, completion: nil)
    }
}
