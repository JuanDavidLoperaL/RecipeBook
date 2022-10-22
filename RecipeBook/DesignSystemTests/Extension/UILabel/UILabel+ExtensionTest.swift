//
//  UILabel+ExtensionTest.swift
//  DesignSystemTests
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

@testable import DesignSystem
import XCTest

class UILabelExtensionTest: XCTestCase {

    func testHeaderSplashApplyStyleLabel() throws {
        let headerSplashStyleConfiguration: TextStyle.Configuration = TextStyle.headerSplash(alignment: .center).getConfiguration()
        let label: UILabel = UILabel()
        label.applyStyle(.headerSplash(alignment: .center))
        XCTAssertEqual(label.textColor, headerSplashStyleConfiguration.textColor.get())
        XCTAssertEqual(label.textAlignment, headerSplashStyleConfiguration.alignment)
        XCTAssertEqual(label.font, headerSplashStyleConfiguration.font)
    }
    
    func testHeaderhApplyStyleLabel() throws {
        let headerStyleConfiguration: TextStyle.Configuration = TextStyle.header(alignment: .center).getConfiguration()
        let label: UILabel = UILabel()
        label.applyStyle(.header(alignment: .center))
        XCTAssertEqual(label.textColor, headerStyleConfiguration.textColor.get())
        XCTAssertEqual(label.textAlignment, headerStyleConfiguration.alignment)
        XCTAssertEqual(label.font, headerStyleConfiguration.font)
    }
    
    func testBodyApplyStyleLabel() throws {
        let bodyStyleConfiguration: TextStyle.Configuration = TextStyle.body(alignment: .center).getConfiguration()
        let label: UILabel = UILabel()
        label.applyStyle(.body(alignment: .center))
        XCTAssertEqual(label.textColor, bodyStyleConfiguration.textColor.get())
        XCTAssertEqual(label.textAlignment, bodyStyleConfiguration.alignment)
        XCTAssertEqual(label.font, bodyStyleConfiguration.font)
    }
}
