//
//  ViewConfigurationProtocol.swift
//  DesignSystem
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import Foundation

public protocol ViewConfigurationProtocol {
    func setup()
    func viewHierarchy()
    func viewConstraints()
    func viewExtraConfiguration()
}

public extension ViewConfigurationProtocol {
    func setup() {
        viewHierarchy()
        viewConstraints()
        viewExtraConfiguration()
    }
    
    func viewExtraConfiguration() {}
}
