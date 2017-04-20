//
//  SemanticVersion.swift
//  SemanticVersion
//
//  Created by atsushi.sakai on 2016/03/06.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import Foundation

fileprivate func < <T : Comparable>(lhs: T, rhs: T) -> Bool {
  switch (lhs, rhs) {
  case let (l, r):
    return l < r
  }
}

fileprivate func > <T : Comparable>(lhs: T, rhs: T) -> Bool {
  switch (lhs, rhs) {
  case let (l, r):
    return l > r
  }
}


open class SemanticVersion {
    let major: Int
    let minor: Int
    let patch: Int
    var prerelease: String? = nil
    var build: String? = nil

    public init(_ string: String) {
        let matched = SemanticVersionParser.parse(string)

        let full_versions: [String] = matched.components(separatedBy: "-").flatMap({ String($0) })
        let versions = full_versions[0].components(separatedBy: ".").flatMap({ Int($0) })
        self.major = versions[0]
        self.minor = versions[1]
        self.patch = versions[2]
        if full_versions.count < 2 {
            return
        }

        let additional: [String] = full_versions[1].components(separatedBy: "+").flatMap({ String($0) })
        self.prerelease = additional[0]
        if additional.count < 2 {
            return
        }

        self.build = additional[1]
    }
}

extension SemanticVersion: Comparable { }

public func == (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    return lhs.major == rhs.major
    && lhs.minor == rhs.minor
    && lhs.patch == rhs.patch
    && lhs.prerelease == rhs.prerelease
}

public func != (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    return !(lhs == rhs)
}

public func > (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    if lhs.major > rhs.major || lhs.minor > rhs.minor || lhs.patch > rhs.patch {
        return true
    }

    // for example: 1.0.0 > 1.0.0-rc.1
    switch (lhs.prerelease, rhs.prerelease) {
    case (.some, .none):
        return false
    case (.none, .some):
        return true
    case (.none, .none):
        return false
    case (.some, .some):
        break
    }

    guard let lhs_pair = lhs.prerelease?.components(separatedBy: ".").map({ String?($0) }) else { fatalError() }
    guard let rhs_pair = rhs.prerelease?.components(separatedBy: ".").map({ String?($0) }) else { fatalError() }

    if lhs_pair[0] != rhs_pair[0] {
        return lhs_pair[0]! > rhs_pair[0]!
    }

    // for example: 1.0.0-rc.1 > 1.0.0-rc
    if lhs_pair.count > rhs_pair.count {
        return true
    }

    let lhs_number = lhs_pair.count >= 2 ? lhs_pair[1]: nil
    let rhs_number = rhs_pair.count >= 2 ? rhs_pair[1]: nil
    switch (lhs_number, rhs_number) {
    case (.some, .some):
        let regexp_num = Regexp("^([0-9]+)$")
        if regexp_num.isMatch(lhs_number!) && regexp_num.isMatch(rhs_number!) {
            return Int(lhs_number!)! > Int(rhs_number!)!
        } else {
            return lhs_number! > rhs_number!
        }
    case (.some, .none):
        return true
    case (.none, .some):
        return false
    case (.none, .none):
        return false
    }
}

public func >= (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    if lhs > rhs || lhs == rhs {
        return true
    }
    return false
}

public func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    return !(lhs >= rhs)
}

public func <= (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    return !(lhs > rhs)
}
