//
//  LoadView.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 24/10/22.
//

import UIKit

public class LoadingView: UIView {
    
    // MARK: - Private UI Properties
    private let backgroundView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = .black
        view.alpha = 0.5
        return view
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activity: UIActivityIndicatorView = UIActivityIndicatorView()
        activity.style = UIActivityIndicatorView.Style.large
        return activity
    }()
    
    // MARK: - Public Init
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: View Configuration
extension LoadingView: ViewConfigurationProtocol {
    public func viewHierarchy() {
        self.addSubview(backgroundView)
        self.addSubview(activityIndicator)
    }
    
    public func viewConstraints() {
        backgroundView.layout.makeConstraints { view in
            view.topAnchor(toItem: view, toItemAttribute: .top)
            view.leadingAnchor(toItem: view, toItemAttribute: .leading)
            view.trailingAnchor(toItem: view, toItemAttribute: .trailing)
            view.bottomAnchor(toItem: view, toItemAttribute: .bottom)
        }
        
        activityIndicator.layout.makeConstraints { view in
            view.centerXAnchor(toItem: self, toItemAttribute: .centerX)
            view.centerYAnchor(toItem: self, toItemAttribute: .centerY)
            view.widthAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 50.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 50.0)
        }
    }
    
    public func viewConfiguration() {
        backgroundColor = .clear
    }
}

// MARK: - Internal Function
extension LoadingView {
    func activeLoader() {
        activityIndicator.startAnimating()
    }
    
    func desactiveLoader() {
        activityIndicator.stopAnimating()
    }
}

