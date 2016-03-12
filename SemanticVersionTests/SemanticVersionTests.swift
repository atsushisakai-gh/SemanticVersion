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
        let sv = SemanticVersion("1.0.0") // FIXME
        XCTAssertNotNil(sv)
        XCTAssert(sv.major == 1)
        XCTAssert(sv.minor == 0)
        XCTAssert(sv.patch == 0)
    }

    func testEqual() {
        let lhs = SemanticVersion("1.0.0")
        let rhs = SemanticVersion("1.0.0")
        XCTAssertTrue(lhs == rhs)

        let rhs_major = SemanticVersion("2.0.0")
        XCTAssertFalse(lhs == rhs_major)

        let rhs_minor = SemanticVersion("1.1.0")
        XCTAssertFalse(lhs == rhs_minor)

        let rhs_patch = SemanticVersion("1.0.1")
        XCTAssertFalse(lhs == rhs_patch)
    }

    func testNotEqual() {
        let lhs = SemanticVersion("1.0.0")
        let rhs = SemanticVersion("1.0.0")
        XCTAssertFalse(lhs != rhs)

        let rhs_major = SemanticVersion("2.0.0")
        XCTAssertTrue(lhs != rhs_major)

        let rhs_minor = SemanticVersion("1.1.0")
        XCTAssertTrue(lhs != rhs_minor)

        let rhs_patch = SemanticVersion("1.0.1")
        XCTAssertTrue(lhs != rhs_patch)
    }

    func testGreaterThan() {
        var lhs: SemanticVersion
        var rhs: SemanticVersion

        lhs = SemanticVersion("2.0.0")
        rhs = SemanticVersion("1.0.0")
        XCTAssertTrue(lhs > rhs)

        lhs = SemanticVersion("1.1.0")
        rhs = SemanticVersion("1.0.0")
        XCTAssertTrue(lhs > rhs)

        lhs = SemanticVersion("1.0.1")
        rhs = SemanticVersion("1.0.0")
        XCTAssertTrue(lhs > rhs)

        lhs = SemanticVersion("0.9.101")
        rhs = SemanticVersion("0.9.100")
        XCTAssertTrue(lhs > rhs)

        lhs = SemanticVersion("10.0.2")
        rhs = SemanticVersion("10.0.1")
        XCTAssertTrue(lhs > rhs)

        lhs = SemanticVersion("1.0.0")
        rhs = SemanticVersion("1.0.1")
        XCTAssertFalse(lhs > rhs)
    }

    func testGreaterThanOrEqual() {
        var lhs: SemanticVersion
        var rhs: SemanticVersion

        lhs = SemanticVersion("1.0.0")
        rhs = SemanticVersion("1.0.0")
        XCTAssertTrue(lhs >= rhs)

        lhs = SemanticVersion("1.0.1")
        rhs = SemanticVersion("1.0.0")
        XCTAssertTrue(lhs >= rhs)

        lhs = SemanticVersion("1.0.0")
        rhs = SemanticVersion("1.0.1")
        XCTAssertFalse(lhs >= rhs)
    }

    func testLessThan() {
        var lhs: SemanticVersion
        var rhs: SemanticVersion

        lhs = SemanticVersion("1.0.0")
        rhs = SemanticVersion("2.0.0")
        XCTAssertTrue(lhs < rhs)

        lhs = SemanticVersion("1.0.0")
        rhs = SemanticVersion("1.1.0")
        XCTAssertTrue(lhs < rhs)

        lhs = SemanticVersion("1.0.0")
        rhs = SemanticVersion("1.0.1")
        XCTAssertTrue(lhs < rhs)

        lhs = SemanticVersion("0.9.100")
        rhs = SemanticVersion("0.9.101")
        XCTAssertTrue(lhs < rhs)

        lhs = SemanticVersion("10.0.1")
        rhs = SemanticVersion("10.0.2")
        XCTAssertTrue(lhs < rhs)

        lhs = SemanticVersion("1.0.1")
        rhs = SemanticVersion("1.0.0")
        XCTAssertFalse(lhs < rhs)
    }

    func testLessThanOrEqual() {
        var lhs: SemanticVersion
        var rhs: SemanticVersion

        lhs = SemanticVersion("1.0.0")
        rhs = SemanticVersion("1.0.0")
        XCTAssertTrue(lhs <= rhs)

        lhs = SemanticVersion("1.0.0")
        rhs = SemanticVersion("1.0.1")
        XCTAssertTrue(lhs <= rhs)

        lhs = SemanticVersion("1.0.1")
        rhs = SemanticVersion("1.0.0")
        XCTAssertFalse(lhs <= rhs)
    }

    // MARK: PreRelease
//    func testPrereleaseEqual() {
//        var lhs: SemanticVersion
//        var rhs: SemanticVersion
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("1.0.0-alpha")
//        XCTAssertFalse(lhs == rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertFalse(lhs == rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertFalse(lhs == rhs)
//    }
}
