//
//  SemanticVersionParserTests.swift
//  SemanticVersion
//
//  Created by atsushi.sakai on 2016/03/12.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import XCTest

class SemanticVersionParserTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testParseVersion() {
        XCTAssertTrue(SemanticVersionParser.parse("2.0.0") == "2.0.0")
        XCTAssertTrue(SemanticVersionParser.parse("2.0.0-rc") == "2.0.0-rc")
        XCTAssertTrue(SemanticVersionParser.parse("2.0.0-rc.1") == "2.0.0-rc.1")
        XCTAssertTrue(SemanticVersionParser.parse("2.0.0-rc.1+build.1") == "2.0.0-rc.1+build.1")
    }
}
