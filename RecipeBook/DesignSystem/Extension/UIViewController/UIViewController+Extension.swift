//
//  UIViewController+Extension.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 24/10/22.
//

import UIKit

public extension UIViewController {
    func hideLoading(hideNav: Bool? = false) {
        for view in self.view.subviews where view as? LoadingView != nil {
            view.removeFromSuperview()
        }
    }
    
    func showLoading() {
        let loadingView: LoadingView = LoadingView()
        self.view.addSubview(loadingView)
        
        loadingView.layout.makeConstraints { view in
            view.topAnchor(toItem: self.view, toItemAttribute: .top)
            view.leadingAnchor(toItem: self.view, toItemAttribute: .leading)
            view.trailingAnchor(toItem: self.view, toItemAttribute: .trailing)
            view.bottomAnchor(toItem: self.view, toItemAttribute: .bottom)
        }
        
        loadingView.activeLoader()
    }
}
