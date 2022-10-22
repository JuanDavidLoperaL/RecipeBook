//
//  SplashViewController.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import Lottie
import UIKit

class SplashViewControllers: UIViewController {

    // MARK: - Private UI Properties
    private let baseView: SplashView = SplashView()
    
    // MARK: - Internal Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life cycle
    override func loadView() {
        self.view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseView.delegate = self
    }
}

// MARK: - SplashView Delegate Implementation
extension SplashViewControllers: SplashViewDelegate {
    func animationHasFinished() {
        print("Move to next screen")
    }
}
