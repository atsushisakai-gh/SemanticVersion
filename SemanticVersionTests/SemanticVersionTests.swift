//
//  SemanticVersionTests.swift
//  SemanticVersionTests
//
//  Created by 酒井篤 on 2016/03/06.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import XCTest
@testable import SemanticVersion

class SemanticVersionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitialize() {
        let sv = SemanticVersion(string: "1.0.0") // FIXME
        XCTAssertNotNil(sv)
        XCTAssert(sv.major == 1)
        XCTAssert(sv.minor == 0)
        XCTAssert(sv.patch == 0)
    }
    
    func testEqual() {
        let lhs = SemanticVersion(string: "1.0.0")
        let rhs = SemanticVersion(string: "1.0.0")
        XCTAssertTrue(lhs == rhs)

        let rhs_major = SemanticVersion(string: "2.0.0")
        XCTAssertFalse(lhs == rhs_major)

        let rhs_minor = SemanticVersion(string: "1.1.0")
        XCTAssertFalse(lhs == rhs_minor)

        let rhs_patch = SemanticVersion(string: "1.0.1")
        XCTAssertFalse(lhs == rhs_patch)
    }
}
