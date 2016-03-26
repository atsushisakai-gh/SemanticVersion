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
        let sv = SemanticVersion("1.0.0")
        XCTAssertNotNil(sv)
        XCTAssert(sv.major == 1)
        XCTAssert(sv.minor == 0)
        XCTAssert(sv.patch == 0)
        XCTAssert(sv.prerelease == nil)
        XCTAssert(sv.build == nil)

        let svWithPre = SemanticVersion("1.0.0-rc.1")
        XCTAssertNotNil(svWithPre)
        XCTAssert(svWithPre.major == 1)
        XCTAssert(svWithPre.minor == 0)
        XCTAssert(svWithPre.patch == 0)
        XCTAssert(svWithPre.prerelease == "rc.1")
        XCTAssert(svWithPre.build == nil)

        let svWithPreNoNum = SemanticVersion("1.0.0-rc")
        XCTAssertNotNil(svWithPreNoNum)
        XCTAssert(svWithPreNoNum.major == 1)
        XCTAssert(svWithPreNoNum.minor == 0)
        XCTAssert(svWithPreNoNum.patch == 0)
        XCTAssert(svWithPreNoNum.prerelease == "rc")
        XCTAssert(svWithPreNoNum.build == nil)

        let svWithBuild = SemanticVersion("1.0.0-rc.1+build.1")
        XCTAssertNotNil(svWithBuild)
        XCTAssert(svWithBuild.major == 1)
        XCTAssert(svWithBuild.minor == 0)
        XCTAssert(svWithBuild.patch == 0)
        XCTAssert(svWithBuild.prerelease == "rc.1")
        XCTAssert(svWithBuild.build == "build.1")
    }

//    func testEqual() {
//        let lhs = SemanticVersion("1.0.0")
//        let rhs = SemanticVersion("1.0.0")
//        XCTAssertTrue(lhs == rhs)
//
//        let rhs_major = SemanticVersion("2.0.0")
//        XCTAssertFalse(lhs == rhs_major)
//
//        let rhs_minor = SemanticVersion("1.1.0")
//        XCTAssertFalse(lhs == rhs_minor)
//
//        let rhs_patch = SemanticVersion("1.0.1")
//        XCTAssertFalse(lhs == rhs_patch)
//    }
//
//    func testNotEqual() {
//        let lhs = SemanticVersion("1.0.0")
//        let rhs = SemanticVersion("1.0.0")
//        XCTAssertFalse(lhs != rhs)
//
//        let rhs_major = SemanticVersion("2.0.0")
//        XCTAssertTrue(lhs != rhs_major)
//
//        let rhs_minor = SemanticVersion("1.1.0")
//        XCTAssertTrue(lhs != rhs_minor)
//
//        let rhs_patch = SemanticVersion("1.0.1")
//        XCTAssertTrue(lhs != rhs_patch)
//    }
//
//    func testGreaterThan() {
//        var lhs: SemanticVersion
//        var rhs: SemanticVersion
//
//        lhs = SemanticVersion("2.0.0")
//        rhs = SemanticVersion("1.0.0")
//        XCTAssertTrue(lhs > rhs)
//
//        lhs = SemanticVersion("1.1.0")
//        rhs = SemanticVersion("1.0.0")
//        XCTAssertTrue(lhs > rhs)
//
//        lhs = SemanticVersion("1.0.1")
//        rhs = SemanticVersion("1.0.0")
//        XCTAssertTrue(lhs > rhs)
//
//        lhs = SemanticVersion("0.9.101")
//        rhs = SemanticVersion("0.9.100")
//        XCTAssertTrue(lhs > rhs)
//
//        lhs = SemanticVersion("10.0.2")
//        rhs = SemanticVersion("10.0.1")
//        XCTAssertTrue(lhs > rhs)
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("1.0.1")
//        XCTAssertFalse(lhs > rhs)
//    }
//
//    func testGreaterThanOrEqual() {
//        var lhs: SemanticVersion
//        var rhs: SemanticVersion
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("1.0.0")
//        XCTAssertTrue(lhs >= rhs)
//
//        lhs = SemanticVersion("1.0.1")
//        rhs = SemanticVersion("1.0.0")
//        XCTAssertTrue(lhs >= rhs)
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("1.0.1")
//        XCTAssertFalse(lhs >= rhs)
//    }
//
//    func testLessThan() {
//        var lhs: SemanticVersion
//        var rhs: SemanticVersion
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("2.0.0")
//        XCTAssertTrue(lhs < rhs)
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("1.1.0")
//        XCTAssertTrue(lhs < rhs)
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("1.0.1")
//        XCTAssertTrue(lhs < rhs)
//
//        lhs = SemanticVersion("0.9.100")
//        rhs = SemanticVersion("0.9.101")
//        XCTAssertTrue(lhs < rhs)
//
//        lhs = SemanticVersion("10.0.1")
//        rhs = SemanticVersion("10.0.2")
//        XCTAssertTrue(lhs < rhs)
//
//        lhs = SemanticVersion("1.0.1")
//        rhs = SemanticVersion("1.0.0")
//        XCTAssertFalse(lhs < rhs)
//    }
//
//    func testLessThanOrEqual() {
//        var lhs: SemanticVersion
//        var rhs: SemanticVersion
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("1.0.0")
//        XCTAssertTrue(lhs <= rhs)
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("1.0.1")
//        XCTAssertTrue(lhs <= rhs)
//
//        lhs = SemanticVersion("1.0.1")
//        rhs = SemanticVersion("1.0.0")
//        XCTAssertFalse(lhs <= rhs)
//    }
//
//    // MARK: PreRelease
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
//        XCTAssertTrue(lhs == rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.1+build.1")
//        XCTAssertTrue(lhs == rhs)
//    }
//
//    func testPrereleaseNotEqual() {
//        var lhs: SemanticVersion
//        var rhs: SemanticVersion
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("1.0.0-alpha")
//        XCTAssertTrue(lhs != rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertTrue(lhs != rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertFalse(lhs != rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.1+build.1")
//        XCTAssertFalse(lhs != rhs)
//    }
//
//    func testPrereleaseGreaterThan() {
//        var lhs: SemanticVersion
//        var rhs: SemanticVersion
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertFalse(lhs > rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.2")
//        XCTAssertFalse(lhs > rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha")
//        rhs = SemanticVersion("1.0.0")
//        XCTAssertTrue(lhs > rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha")
//        XCTAssertTrue(lhs > rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.2")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertTrue(lhs > rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.2")
//        rhs = SemanticVersion("1.0.0-alpha.1+build.1")
//        XCTAssertTrue(lhs > rhs)
//    }
//
//    func testPrereleaseGreaterThanOrEqual() {
//        var lhs: SemanticVersion
//        var rhs: SemanticVersion
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.2")
//        XCTAssertFalse(lhs >= rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertTrue(lhs >= rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.2")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertTrue(lhs >= rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.2")
//        rhs = SemanticVersion("1.0.0-alpha.1+build.1")
//        XCTAssertTrue(lhs >= rhs)
//    }
//
//    func testPrereleaseLessThan() {
//        var lhs: SemanticVersion
//        var rhs: SemanticVersion
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertFalse(lhs < rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.2")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertFalse(lhs < rhs)
//
//        lhs = SemanticVersion("1.0.0")
//        rhs = SemanticVersion("1.0.0-alpha")
//        XCTAssertTrue(lhs < rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertTrue(lhs < rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.2")
//        XCTAssertTrue(lhs < rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1+build.1")
//        rhs = SemanticVersion("1.0.0-alpha.2")
//        XCTAssertTrue(lhs < rhs)
//    }
//
//    func testPrereleaseLessThanOrEqual() {
//        var lhs: SemanticVersion
//        var rhs: SemanticVersion
//
//        lhs = SemanticVersion("1.0.0-alpha.2")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertFalse(lhs <= rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.1")
//        XCTAssertTrue(lhs <= rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1")
//        rhs = SemanticVersion("1.0.0-alpha.2")
//        XCTAssertTrue(lhs <= rhs)
//
//        lhs = SemanticVersion("1.0.0-alpha.1+build.1")
//        rhs = SemanticVersion("1.0.0-alpha.2")
//        XCTAssertTrue(lhs <= rhs)
//    }
}
