//
//  SplashView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import DesignSystem
import Lottie
import UIKit

protocol SplashViewDelegate: AnyObject {
    func animationHasFinished()
}

final class SplashView: UIView {
    
    // MARK: - Private UI Properties
    private let splash: LottieAnimationView = {
        let animation: LottieAnimationView = LottieAnimationView()
        animation.animation = LottieAnimation.named("recipesBookAnimation")
        return animation
    }()
    
    private let appTitle: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Recipes Book"
        label.applyStyle(.headerSplash(alignment: .center))
        return label
    }()
    
    // MARK: - Delegate
    weak var delegate: SplashViewDelegate?
    
    // MARK: - Internal Init
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode Configuration
extension SplashView: ViewConfigurationProtocol {
    
    func viewHierarchy() {
        [splash, appTitle].forEach { view in
            addSubview(view)
        }
    }
    
    func viewConstraints() {
        splash.layout.makeConstraints { view in
            view.leadingAnchor(toItem: self, toItemAttribute: .leading)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing)
            view.centerYAnchor(toItem: self, toItemAttribute: .centerY)
            view.heightAnchor(toItem: self, toItemAttribute: .height, multiplier: 0.4)
        }
        
        appTitle.layout.makeConstraints { view in
            view.topAnchor(toItem: splash, toItemAttribute: .bottom, constant: 10.0)
            view.centerXAnchor(toItem: self, toItemAttribute: .centerX)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 31.0)
        }
    }
    
    func viewExtraConfiguration() {
        self.applyStyle(.primary)
        splash.animation = LottieAnimation.named("recipesBookAnimation")
        splash.play { _ in
            self.delegate?.animationHasFinished()
        }
    }
}
