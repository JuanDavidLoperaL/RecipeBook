//
//  SplashView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

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
        animation.translatesAutoresizingMaskIntoConstraints = false
        return animation
    }()
    
    private let appTitle: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Recipes Book"
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .medium)
        label.textAlignment = .center
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
    
    private func setup() {
        self.backgroundColor = .white
        viewHierarchy()
        viewConstraints()
        splash.animation = LottieAnimation.named("recipesBookAnimation")
        splash.play { _ in
            self.delegate?.animationHasFinished()
        }
        
    }
    
    private func viewHierarchy() {
        [splash, appTitle].forEach { view in
            addSubview(view)
        }
    }
    
    private func viewConstraints() {
        NSLayoutConstraint(item: splash, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leadingMargin, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: splash, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: splash, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: splash, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.4, constant: 0.0).isActive = true
        
        NSLayoutConstraint(item: appTitle, attribute: .top, relatedBy: .equal, toItem: splash, attribute: .bottom, multiplier: 1.0, constant: 10.0).isActive = true
        NSLayoutConstraint(item: appTitle, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: appTitle, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 31.0).isActive = true
    }
}
