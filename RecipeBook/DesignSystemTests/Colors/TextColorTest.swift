//
//  TextColorTest.swift
//  DesignSystemTests
//
//  Created by Juan david Lopera lopez on 22/10/22.
//

@testable import DesignSystem
import XCTest

class TextColorTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPrimaryColor() throws {
        let color: TextColor = TextColor.primary
        XCTAssertEqual(color.get(), chalkBlack)
    }
    
    func testSecondaryColor() throws {
        let color: TextColor = TextColor.secondary
        XCTAssertEqual(color.get(), transparentBlack)
    }

}
