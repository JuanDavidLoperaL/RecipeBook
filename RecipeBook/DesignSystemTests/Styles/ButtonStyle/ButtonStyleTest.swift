//
//  ButtonStyleTest.swift
//  DesignSystemTests
//
//  Created by Juan david Lopera lopez on 23/10/22.
//

import XCTest
@testable import DesignSystem

class ButtonStyleTest: XCTestCase {

    func testButtonStylePrimaryConfiguration() throws {
        let primaryConfiguration: ButtonStyle.Configuration = ButtonStyle.primaryBtn.getConfiguration()
        XCTAssertEqual(primaryConfiguration.textColor, TextColor.white)
        XCTAssertEqual(primaryConfiguration.alignment, .center)
        XCTAssertEqual(primaryConfiguration.font, .systemFont(ofSize: 15.0, weight: .medium))
        XCTAssertEqual(primaryConfiguration.borderWidth, 0.0)
        XCTAssertEqual(primaryConfiguration.cornerRadius, 10.0)
        XCTAssertEqual(primaryConfiguration.borderColor, .clear)
    }
    
    func testButtonStyleSecondaryConfiguration() throws {
        let secondaryConfiguration: ButtonStyle.Configuration = ButtonStyle.secondaryBtn.getConfiguration()
        XCTAssertEqual(secondaryConfiguration.textColor, TextColor.buttonSecondary)
        XCTAssertEqual(secondaryConfiguration.alignment, .center)
        XCTAssertEqual(secondaryConfiguration.font, .systemFont(ofSize: 15.0, weight: .medium))
        XCTAssertEqual(secondaryConfiguration.borderWidth, 1.5)
        XCTAssertEqual(secondaryConfiguration.cornerRadius, 10.0)
        XCTAssertEqual(secondaryConfiguration.borderColor, .secondary)
    }
    
    func testButtonStyleLinkConfiguration() throws {
        let linkConfiguration: ButtonStyle.Configuration = ButtonStyle.primaryBtn.getConfiguration()
        XCTAssertEqual(linkConfiguration.textColor, TextColor.white)
        XCTAssertEqual(linkConfiguration.alignment, .center)
        XCTAssertEqual(linkConfiguration.font, .systemFont(ofSize: 15, weight: .medium))
        XCTAssertEqual(linkConfiguration.borderWidth, 0.0)
        XCTAssertEqual(linkConfiguration.cornerRadius, 10.0)
        XCTAssertEqual(linkConfiguration.borderColor, .clear)
    }
}
