//
//  BackgroundColorTest.swift
//  DesignSystemTests
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

@testable import DesignSystem
import XCTest

class BackgroundColorTest: XCTestCase {

    func testPrimaryColor() throws {
        let color: BackgroundColor = BackgroundColor.primary
        XCTAssertEqual(color.get(), timberwolf)
    }
    
    func testSecondaryColor() throws {
        let color: BackgroundColor = BackgroundColor.secondary
        XCTAssertEqual(color.get(), brightGray)
    }

}
