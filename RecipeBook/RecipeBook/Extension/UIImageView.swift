//
//  UIImageView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import UIKit

extension UIImageView {
    func load(urlStr: String) {
        if let url: URL = URL(string: urlStr) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        } else {
            self.image = UIImage(named: "placeHolder")
        }
    }
}
