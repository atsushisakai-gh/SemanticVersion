//
//  RegexpTests.swift
//  SemanticVersion
//
//  Created by atsushi.sakai on 2016/03/07.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import XCTest

class RegexpTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitialize() {
       let regexp = Regexp("(\\d+)")
        XCTAssertNotNil(regexp.internalRegexp)
        XCTAssert(regexp.pattern == "(\\d+)")
    }

    func testIsMatch() {
        let regexp = Regexp("(\\d+)")
        XCTAssert(regexp.isMatch("1"))
        XCTAssert(regexp.isMatch("10"))
        XCTAssert(regexp.isMatch("-1"))
        XCTAssertFalse(regexp.isMatch("a"))
    }

    func testMatches() {
        let regexp = Regexp("(\\d+)")
        XCTAssert(regexp.matches("1aaa")! == ["1"])
        XCTAssert(regexp.matches("a1a")! == ["1"])
        XCTAssert(regexp.matches("a1a2")! == ["1", "2"])
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
