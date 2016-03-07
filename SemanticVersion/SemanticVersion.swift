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
    
    init(string: String) {
        let regexp = Regexp("\\A(\\d+)\\.(\\d+)\\.(\\d+)\\Z")
        guard let match: String = regexp.matches(string)?.first else { fatalError("FIXME: handle error") }
        let array = match.componentsSeparatedByString(".").flatMap( {Int($0)})
        self.major = array[0]
        self.minor = array[1]
        self.patch = array[2]
    }
}

extension SemanticVersion : Equatable {}
    
public func ==(lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
    return lhs.major == rhs.major
        && lhs.minor == rhs.minor
        && lhs.patch == rhs.patch
}
