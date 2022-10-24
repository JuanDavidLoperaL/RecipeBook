//
//  DetailRecipeView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 24/10/22.
//

import DesignSystem
import UIKit

final class DetailRecipeView: UIView {
    
    // MARK: - Private Properties
    private let scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        return scrollView
    }()
    
    private let mainImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let recipeTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.applyStyle(.header(alignment: .left))
        label.numberOfLines = 0
        return label
    }()
    
    private let servingsLabel: UILabel = {
        let label: UILabel = UILabel()
        label.applyStyle(.body(alignment: .left))
        return label
    }()
    
    private let preparationTimeLabel: UILabel = {
        let label: UILabel = UILabel()
        label.applyStyle(.body(alignment: .left))
        return label
    }()
    
    private let summaryLabel: UILabel = {
        let label: UILabel = UILabel()
        label.applyStyle(.body(alignment: .left))
        label.numberOfLines = 0
        return label
    }()
    
    private let favoriteButton: UIButton = {
        let button: UIButton = UIButton()
        button.addTarget(self, action: #selector(addFavoriteAction), for: .touchDown)
        button.applyStyle(.primaryBtn)
        return button
    }()
    
    // MARK: - Private Properties
    var viewModel: DetailRecipeViewModel?
    
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
extension DetailRecipeView: ViewConfigurationProtocol {
    func viewHierarchy() {
        addSubview(scrollView)
        [mainImage, recipeTitleLabel, servingsLabel, preparationTimeLabel, summaryLabel, favoriteButton].forEach { view in
            scrollView.addSubview(view)
        }
    }
    
    func viewConstraints() {
        scrollView.layout.makeConstraints { view in
            view.topAnchor(toItem: self, toItemAttribute: .topMargin)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing)
            view.bottomAnchor(toItem: self, toItemAttribute: .bottomMargin)
        }
        
        mainImage.layout.makeConstraints { view in
            view.topAnchor(toItem: scrollView, toItemAttribute: .top, constant: 30.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 200.0)
        }
        
        recipeTitleLabel.layout.makeConstraints { view in
            view.topAnchor(toItem: mainImage, toItemAttribute: .bottom, constant: 8.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
        }
        
        servingsLabel.layout.makeConstraints { view in
            view.topAnchor(toItem: recipeTitleLabel, toItemAttribute: .bottom, constant: 4.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 13.0)
        }
        
        preparationTimeLabel.layout.makeConstraints { view in
            view.topAnchor(toItem: servingsLabel, toItemAttribute: .bottom, constant: 4.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 13.0)
        }
        
        summaryLabel.layout.makeConstraints { view in
            view.topAnchor(toItem: preparationTimeLabel, toItemAttribute: .bottom, constant: 4.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.bottomAnchor(toItem: favoriteButton, toItemAttribute: .top, constant: -10.0)
        }
        
        favoriteButton.layout.makeConstraints { view in
            view.bottomAnchor(toItem: scrollView, toItemAttribute: .bottom, constant: -20.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 50.0)
        }
    }
    
    func viewExtraConfiguration() {
        self.applyStyle(.primary)
    }
}

// MARK: - Internal Functions
extension DetailRecipeView {
    func set(viewModel: DetailRecipeViewModel) {
        self.viewModel = viewModel
        mainImage.load(urlStr: viewModel.viewData.image)
        recipeTitleLabel.text = viewModel.viewData.title
        servingsLabel.text = viewModel.viewData.servings
        preparationTimeLabel.text = viewModel.viewData.preparationTime
        summaryLabel.text = viewModel.viewData.summary
        favoriteButton.setTitle(viewModel.viewData.isFavorite ? "Quitar de favoritos" : "Añadir a favoritos", for: .normal)
    }
}
    
// MARK: - Private Functions
private extension DetailRecipeView {
    @objc
    func addFavoriteAction() {
        viewModel?.addRemoveFavorite()
        let isFavorite: Bool = viewModel?.viewData.isFavorite ?? false
        favoriteButton.setTitle(isFavorite ? "Quitar de favoritos" : "Añadir a favoritos", for: .normal)
    }
}
