//
//  TextStyleTest.swift
//  DesignSystemTests
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

import XCTest
@testable import DesignSystem

class TextStyleTest: XCTestCase {

    func testTextStyleHeaderSplashConfiguration() throws {
        let headerSplashStyleConfiguration: TextStyle.Configuration = TextStyle.headerSplash(alignment: .center).getConfiguration()
        XCTAssertEqual(headerSplashStyleConfiguration.textColor, TextColor.primary)
        XCTAssertEqual(headerSplashStyleConfiguration.alignment, .center)
        XCTAssertEqual(headerSplashStyleConfiguration.font, .systemFont(ofSize: 30.0, weight: .bold))
    }
    
    func testTextStyleHeaderConfiguration() throws {
        let headerStyleConfiguration: TextStyle.Configuration = TextStyle.header(alignment: .center).getConfiguration()
        XCTAssertEqual(headerStyleConfiguration.textColor, TextColor.primary)
        XCTAssertEqual(headerStyleConfiguration.alignment, .center)
        XCTAssertEqual(headerStyleConfiguration.font, .systemFont(ofSize: 17, weight: .medium))
    }
    
    func testTextStyleBodyConfiguration() throws {
        let bodyStyleConfiguration: TextStyle.Configuration = TextStyle.body(alignment: .center).getConfiguration()
        XCTAssertEqual(bodyStyleConfiguration.textColor, TextColor.secondary)
        XCTAssertEqual(bodyStyleConfiguration.alignment, .center)
        XCTAssertEqual(bodyStyleConfiguration.font, .systemFont(ofSize: 12, weight: .regular))
    }
}
