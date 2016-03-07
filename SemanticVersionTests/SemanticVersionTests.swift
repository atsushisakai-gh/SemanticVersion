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
        XCTAssert(sv.major == 0)
        XCTAssert(sv.minor == 0)
        XCTAssert(sv.patch == 0)
    }
    
}
