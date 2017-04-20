//
//  SemanticVersionParser.swift
//  SemanticVersion
//
//  Created by atsushi.sakai on 2016/03/12.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

import Foundation

class SemanticVersionParser {
    static let DEFAULT_REGEXP = Regexp("^([0-9]+\\.[0-9]+\\.[0-9]+)(?:-([0-9A-Za-z-]+(\\.[0-9A-Za-z-]+)*))?(?:\\+([0-9A-Za-z-]+(\\.[0-9A-Za-z-]+)*))?$")

    static func parse(_ input: String) -> String {
        guard let matched: String = DEFAULT_REGEXP.matches(input)?.first else {
            fatalError("can not parse input string to version")
        }
        return matched
    }
}
