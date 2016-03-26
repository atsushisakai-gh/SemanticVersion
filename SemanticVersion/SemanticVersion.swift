//
//  SemanticVersion.swift
//  SemanticVersion
//
//  Created by 酒井篤 on 2016/03/06.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import Foundation

public class SemanticVersion {
    let major: Int
    let minor: Int
    let patch: Int
    var prerelease: String? = nil
    var build: String? = nil

    public init(_ string: String) {
        let matched = SemanticVersionParser.parse(string)

        let full_versions: [String] = matched.componentsSeparatedByString("-").flatMap({ String($0) })
        let versions = full_versions[0].componentsSeparatedByString(".").flatMap({ Int($0) })
        self.major = versions[0]
        self.minor = versions[1]
        self.patch = versions[2]
        if full_versions.count < 2 {
            return
        }

        let additional: [String] = full_versions[1].componentsSeparatedByString("+").flatMap({ String($0) })
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
    case (.Some, .None):
        return false
    case (.None, .Some):
        return true
    case (.None, .None):
        return false
    case (.Some, .Some):
        break
    }

    guard let lhs_pair = lhs.prerelease?.componentsSeparatedByString(".").map({ String?($0) }) else { fatalError() }
    guard let rhs_pair = rhs.prerelease?.componentsSeparatedByString(".").map({ String?($0) }) else { fatalError() }

    if lhs_pair[0] != rhs_pair[0] {
        return lhs_pair[0] > rhs_pair[0]
    }

    // for example: 1.0.0-rc.1 > 1.0.0-rc
    if lhs_pair.count > rhs_pair.count {
        return true
    }

    let lhs_number = lhs_pair.count >= 2 ? lhs_pair[1]: nil
    let rhs_number = rhs_pair.count >= 2 ? rhs_pair[1]: nil
    switch (lhs_number, rhs_number) {
    case (.Some, .Some):
        // Int同士, String同士で比較
        let regexp_num = Regexp("^([0-9]+)$")
        if regexp_num.isMatch(lhs_number!) && regexp_num.isMatch(rhs_number!) {
            return Int(lhs_number!) > Int(rhs_number!)
        } else {
            return lhs_number! > rhs_number!
        }
    case (.Some, .None):
        return true
    case (.None, .Some):
        return false
    case (.None, .None):
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
