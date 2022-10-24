//
//  FavoriteRecipesCell.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import DesignSystem
import UIKit

final class FavoriteRecipesCell: UITableViewCell {
    
    // MARK: - Private UI Properties
    private let containerView: UIView = {
        let view: UIView = UIView()
        view.applyStyle(.secondary)
        return view
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
    
    // MARK: - Internal Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode Configuration
extension FavoriteRecipesCell: ViewConfigurationProtocol {
    func viewHierarchy() {
        [mainImage, recipeTitleLabel, servingsLabel, preparationTimeLabel].forEach { view in
            containerView.addSubview(view)
        }
        contentView.addSubview(containerView)
    }
    
    func viewConstraints() {
        containerView.layout.makeConstraints { view in
            view.topAnchor(toItem: contentView, toItemAttribute: .top, constant: 8.0)
            view.leadingAnchor(toItem: contentView, toItemAttribute: .leading, constant: 16.0)
            view.trailingAnchor(toItem: contentView, toItemAttribute: .trailing, constant: -16.0)
            view.bottomAnchor(toItem: contentView, toItemAttribute: .bottom, constant: -8.0)
        }
        
        mainImage.layout.makeConstraints { view in
            view.topAnchor(toItem: containerView, toItemAttribute: .top)
            view.leadingAnchor(toItem: containerView, toItemAttribute: .leading)
            view.trailingAnchor(toItem: containerView, toItemAttribute: .trailing)
            view.heightAnchor(toItem: contentView, toItemAttribute: .height, multiplier: 0.60)
        }
        
        recipeTitleLabel.layout.makeConstraints { view in
            view.topAnchor(toItem: mainImage, toItemAttribute: .bottom, constant: 8.0)
            view.leadingAnchor(toItem: containerView, toItemAttribute: .leading, constant: 5.0)
            view.trailingAnchor(toItem: containerView, toItemAttribute: .trailing, constant: -5.0)
        }
        
        servingsLabel.layout.makeConstraints { view in
            view.topAnchor(toItem: recipeTitleLabel, toItemAttribute: .bottom, constant: 4.0)
            view.leadingAnchor(toItem: containerView, toItemAttribute: .leading, constant: 5.0)
            view.trailingAnchor(toItem: containerView, toItemAttribute: .trailing, constant: -5.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 13.0)
        }
        
        preparationTimeLabel.layout.makeConstraints { view in
            view.topAnchor(toItem: servingsLabel, toItemAttribute: .bottom, constant: 4.0)
            view.leadingAnchor(toItem: containerView, toItemAttribute: .leading, constant: 5.0)
            view.trailingAnchor(toItem: containerView, toItemAttribute: .trailing, constant: -5.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 13.0)
            view.bottomAnchor(toItem: containerView, toItemAttribute: .bottom, constant: -10.0)
        }
    }
    
    func viewExtraConfiguration() {
        contentView.applyStyle(.primary)
        containerView.layer.cornerRadius = 10.0
    }
}

// MARK: - Internal Functions
extension FavoriteRecipesCell {
    func set(viewModel: FavoriteRecipesViewModel) {
        mainImage.image = UIImage(named: viewModel.mainImage)
        recipeTitleLabel.text = viewModel.recipeTitle
        servingsLabel.text = viewModel.servings
        preparationTimeLabel.text = viewModel.preparationTime
    }
}
