//
//  UIViewExtensionTest.swift
//  DesignSystemTests
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

@testable import DesignSystem
import XCTest

class UIViewExtensionTest: XCTestCase {

    func testPrimaryApplyStyleView() throws {
        let view: UIView = UIView()
        view.applyStyle(.primary)
        XCTAssertEqual(view.backgroundColor, BackgroundColor.primary.get())
    }
    
    func testSecondaryApplyStyleView() throws {
        let view: UIView = UIView()
        view.applyStyle(.secondary)
        XCTAssertEqual(view.backgroundColor, BackgroundColor.secondary.get())
    }
}
