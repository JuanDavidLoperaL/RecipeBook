//
//  RecipeTableViewCell.swift
//  RecipeBook
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import DesignSystem
import UIKit

final class RecipeTableViewCell: UITableViewCell {
    
    // MARK: - Private UI Properties
    private let containerView: UIView = {
        let view: UIView = UIView()
        view.applyStyle(.secondary)
        return view
    }()
    
    private let mainImage: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
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
        button.setTitle("Ver mas", for: .normal)
        return button
    }()
    
    private let addFavoriteButton: UIButton = {
        let button: UIButton = UIButton()
        button.addTarget(self, action: #selector(addFavoriteAction), for: .touchDown)
        return button
    }()
    
    // MARK: - Private Properties
    private var viewModel: HomeViewModel?
    private var cellIndex: Int = 0
    
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
extension RecipeTableViewCell: ViewConfigurationProtocol {
    func viewHierarchy() {
        [mainImage, recipeTitleLabel, servingsLabel, preparationTimeLabel, seeMoreButton, addFavoriteButton].forEach { view in
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
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 200.0)
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
        }
        
        seeMoreButton.layout.makeConstraints { view in
            view.topAnchor(toItem: preparationTimeLabel, toItemAttribute: .bottom, constant: 5.0)
            view.leadingAnchor(toItem: containerView, toItemAttribute: .leading, constant: 2.0)
            view.trailingAnchor(toItem: containerView, toItemAttribute: .trailing, constant: -2.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 45.0)
            view.bottomAnchor(toItem: containerView, toItemAttribute: .bottom, constant: -2.0)
        }
        
        addFavoriteButton.layout.makeConstraints { view in
            view.topAnchor(toItem: containerView, toItemAttribute: .top, constant: 5.0)
            view.trailingAnchor(toItem: containerView, toItemAttribute: .trailing, constant: -10.0)
            view.heightAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 30.0)
            view.widthAnchor(toItem: nil, toItemAttribute: .notAnAttribute, constant: 30.0)
        }
    }
    
    func viewExtraConfiguration() {
        contentView.applyStyle(.primary)
        containerView.layer.cornerRadius = 10.0
    }
}

// MARK: - Internal Functions
extension RecipeTableViewCell {
    func set(viewModel: HomeViewModel, cellIndex: Int) {
        self.cellIndex = cellIndex
        self.viewModel = viewModel
        mainImage.load(urlStr: viewModel.viewData.image)
        recipeTitleLabel.text = viewModel.viewData.title
        servingsLabel.text = viewModel.viewData.servings
        preparationTimeLabel.text = viewModel.viewData.preparationTime
        addFavoriteButton.setImage(UIImage(named: viewModel.viewData.favoriteImage), for: .normal)
    }
}

// MARK: - Private Functions
private extension RecipeTableViewCell {
    @objc
    func addFavoriteAction() {
        viewModel?.addRemoveFavorite(cellIndex: cellIndex)
    }
    
    @objc
    func seeMoreAction() {
        viewModel?.recipeSelected(in: cellIndex)
    }
}
