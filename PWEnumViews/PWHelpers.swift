//
//  PWHelpers.swift
//  PWEnumViews
//
//  Created by Gabriel Morales on 8/17/16.
//  Copyright © 2016 Gabemdev. All rights reserved.
//

import UIKit

extension UIView {
    public func constrainEqual(attribute: NSLayoutAttribute, to: AnyObject, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        constrainEqual(attribute, to: to, attribute, multiplier: multiplier, constant: constant)
    }
    
    public func constrainEqual(attribute: NSLayoutAttribute, to: AnyObject, _ toAttribute: NSLayoutAttribute, multiplier: CGFloat = 1, constant: CGFloat = 0) {
        NSLayoutConstraint.activateConstraints([
            NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .Equal, toItem: to, attribute: toAttribute, multiplier: multiplier, constant: constant)
            ])
    }
    
    
    public func constrainEdges(to view: UIView) {
        constrainEqual(.Top, to: view, .Top)
        constrainEqual(.Leading, to: view, .Leading)
        constrainEqual(.Trailing, to: view, .Trailing)
        constrainEqual(.Bottom, to: view, .Bottom)
    }
    
    /// If the `view` is nil, we take the superview.
    public func center(in view: UIView? = nil) {
        guard let container = view ?? self.superview else { fatalError() }
        centerXAnchor.constrainEqual(container.centerXAnchor)
        centerYAnchor.constrainEqual(container.centerYAnchor)
    }
}

extension NSLayoutAnchor {
    public func constrainEqual(anchor: NSLayoutAnchor, constant: CGFloat = 0) {
        let constraint = constraintEqualToAnchor(anchor, constant: constant)
        constraint.active = true
    }
    
}
