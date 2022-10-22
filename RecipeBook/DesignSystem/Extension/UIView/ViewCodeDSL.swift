//
//  ViewCodeDSL.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import UIKit

public extension UIView {

    var layout: ViewCodeDSL {
        return ViewCodeDSL(view: self)
    }
}

public class ViewCodeDSL {

    let view: UIView

    init(view: UIView) {
        self.view = view
    }

    public func makeConstraints(_ block: ((UIView) -> Void)) {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        block(self.view)
    }
}
