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
    var prereleaseBase: String? = nil
    var prereleaseNumber: Int? = nil
    var build: String? = nil

    public init(_ string: String) {
        let matched = SemanticVersionParser.parse(string)
        let structures: [String] = matched.componentsSeparatedByString("-").flatMap({ String($0) })
        let versions = structures[0].componentsSeparatedByString(".").flatMap({ Int($0) })
        self.major = versions[0]
        self.minor = versions[1]
        self.patch = versions[2]
        if structures.count < 2 {
            return
        }

        let specials: [String] = structures[1].componentsSeparatedByString("+").flatMap({ String($0) })
        let prereleases = specials[0].componentsSeparatedByString(".")
        self.prereleaseBase = String(prereleases[0])
        self.prereleaseNumber = prereleases.count >= 2 ? Int(prereleases[1]) : nil
        if specials.count < 2 {
            return
        }

        self.build = specials[1]
    }
}

extension SemanticVersion: Equatable { }

public func == (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    return lhs.major == rhs.major
    && lhs.minor == rhs.minor
    && lhs.patch == rhs.patch
    && lhs.prereleaseBase == rhs.prereleaseBase
    && lhs.prereleaseNumber == rhs.prereleaseNumber
}

public func != (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    return lhs.major != rhs.major
    || lhs.minor != rhs.minor
    || lhs.patch != rhs.patch
    || lhs.prereleaseBase != rhs.prereleaseBase
    || lhs.prereleaseNumber != rhs.prereleaseNumber
}

extension SemanticVersion: Comparable { }

public func > (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    if lhs.major > rhs.major || lhs.minor > rhs.minor || lhs.patch > rhs.patch {
        return true
    }

    if lhs.prereleaseBase > rhs.prereleaseBase || lhs.prereleaseNumber > rhs.prereleaseNumber {
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
    if lhs.major < rhs.major || lhs.minor < rhs.minor || lhs.patch < rhs.patch {
        return true
    }

    if lhs.prereleaseBase < rhs.prereleaseBase || lhs.prereleaseNumber < rhs.prereleaseNumber {
        return true
    }
    return false
}

public func <= (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    if lhs < rhs || lhs == rhs {
        return true
    }
    return false
}
