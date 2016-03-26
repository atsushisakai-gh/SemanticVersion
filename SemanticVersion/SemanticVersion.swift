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

    // FIXME:
    if lhs.prerelease > rhs.prerelease {
        return true
    }
    return false
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
