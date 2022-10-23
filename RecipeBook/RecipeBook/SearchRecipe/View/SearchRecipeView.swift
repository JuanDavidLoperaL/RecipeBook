//
//  SearchRecipeView.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import DesignSystem
import UIKit

final class SearchRecipeView: UIView {
    
    // MARK: - Private UI Properties
    private let searchTextField: UITextField = {
        let textField: UITextField = UITextField()
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button: UIButton = UIButton()
        button.applyStyle(.primaryBtn)
        button.setTitle("Buscar", for: .normal)
        button.addTarget(self, action: #selector(searchAction), for: .touchDown)
        return button
    }()
    
    private let mainImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
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
    
    private let seeMoreButton: UIButton = {
        let button: UIButton = UIButton()
        button.addTarget(self, action: #selector(seeMoreAction), for: .touchDown)
        button.applyStyle(.link)
        return button
    }()
    
    private let addFavoriteButton: UIButton = {
        let button: UIButton = UIButton()
        button.addTarget(self, action: #selector(addFavoriteAction), for: .touchDown)
        button.applyStyle(.primaryBtn)
        return button
    }()
    
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
extension SearchRecipeView: ViewConfigurationProtocol {
    func viewHierarchy() {
        [searchTextField, searchButton, mainImage, recipeTitleLabel, servingsLabel, preparationTimeLabel, seeMoreButton, addFavoriteButton].forEach { view in
            addSubview(view)
        }
    }
    
    func viewConstraints() {
        searchButton.layout.makeConstraints { view in
            view.topAnchor(toItem: self, toItemAttribute: .topMargin, constant: 30.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.widthAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 70.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 45.0)
        }
        
        searchTextField.layout.makeConstraints { view in
            view.topAnchor(toItem: self, toItemAttribute: .topMargin, constant: 30.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: searchButton, toItemAttribute: .leading, constant: -16.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 45.0)
        }
        
        mainImage.layout.makeConstraints { view in
            view.topAnchor(toItem: searchTextField, toItemAttribute: .bottom, constant: 50.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.heightAnchor(toItem: self, toItemAttribute: .height, multiplier: 0.35)
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
        
        addFavoriteButton.layout.makeConstraints { view in
            view.bottomAnchor(toItem: seeMoreButton, toItemAttribute: .top, constant: -8.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 45.0)
        }
        
        seeMoreButton.layout.makeConstraints { view in
            view.bottomAnchor(toItem: self, toItemAttribute: .bottomMargin, constant: -16.0)
            view.leadingAnchor(toItem: self, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: self, toItemAttribute: .trailing, constant: -16.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 45.0)
        }
    }
    
    func viewExtraConfiguration() {
        self.applyStyle(.primary)
    }
    
}

// MARK: - Private Functions
private extension SearchRecipeView {
    @objc
    func seeMoreAction() {
        print("Ver mas")
    }
    
    @objc
    func addFavoriteAction() {
        print("adicionando a favoritos")
    }
    
    @objc
    func searchAction() {
        print("Buscando")
    }
}

// MARK: - Internal Function
extension SearchRecipeView {
    func set(viewModel: SearchRecipeViewModel) {
        mainImage.image = UIImage(named: viewModel.mainImage)
        recipeTitleLabel.text = viewModel.recipeTitle
        servingsLabel.text = viewModel.servings
        preparationTimeLabel.text = viewModel.preparationTime
        addFavoriteButton.setTitle(viewModel.addFavorite, for: .normal)
        seeMoreButton.setTitle(viewModel.seeMore, for: .normal)
    }
}
