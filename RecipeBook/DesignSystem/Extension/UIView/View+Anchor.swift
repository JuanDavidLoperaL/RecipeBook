//
//  View+Anchor.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import UIKit

extension UIView {

    public func constraintToSuperview() {
        if let view = self.superview {
            self
                .topAnchor(toItem: view, toItemAttribute: .topMargin)
                .leadingAnchor(toItem: view, toItemAttribute: .leading)
                .trailingAnchor(toItem: view, toItemAttribute: .trailing)
                .bottomAnchor(toItem: view, toItemAttribute: .bottom)
        }
    }

    @discardableResult
    public func topAnchor(relatedBy: NSLayoutConstraint.Relation = .equal, toItem: Any?, toItemAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: relatedBy, toItem: toItem, attribute: toItemAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true

        return self
    }

    @discardableResult
    public func bottomAnchor(relatedBy: NSLayoutConstraint.Relation = .equal, toItem: Any?, toItemAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: relatedBy, toItem: toItem, attribute: toItemAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true

        return self
    }
    
    @discardableResult
    public func leadingAnchor(relatedBy: NSLayoutConstraint.Relation = .equal, toItem: Any?, toItemAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: relatedBy, toItem: toItem, attribute: toItemAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true

        return self
    }
    
    @discardableResult
    public func trailingAnchor(relatedBy: NSLayoutConstraint.Relation = .equal, toItem: Any?, toItemAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: relatedBy, toItem: toItem, attribute: toItemAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true

        return self
    }
    
    @discardableResult
    public func heightAnchor(relatedBy: NSLayoutConstraint.Relation = .equal, toItem: Any?, toItemAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: relatedBy, toItem: toItem, attribute: toItemAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true

        return self
    }
    
    @discardableResult
    public func widthAnchor(relatedBy: NSLayoutConstraint.Relation = .equal, toItem: Any?, toItemAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .width, relatedBy: relatedBy, toItem: toItem, attribute: toItemAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true

        return self
    }
    
    @discardableResult
    public func centerXAnchor(relatedBy: NSLayoutConstraint.Relation = .equal, toItem: Any?, toItemAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: relatedBy, toItem: toItem, attribute: toItemAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true

        return self
    }
    
    @discardableResult
    public func centerYAnchor(relatedBy: NSLayoutConstraint.Relation = .equal, toItem: Any?, toItemAttribute: NSLayoutConstraint.Attribute, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = UILayoutPriority.required) -> Self {
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: relatedBy, toItem: toItem, attribute: toItemAttribute, multiplier: multiplier, constant: constant)
        constraint.priority = priority
        constraint.isActive = true

        return self
    }
}

