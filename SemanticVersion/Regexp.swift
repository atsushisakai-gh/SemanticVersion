//
//  Regexp.swift
//  SemanticVersion
//
//  Created by atsushi.sakai on 2016/03/07.
//  Copyright © 2016年 Atsushi Sakai. All rights reserved.
//

// Inspired by https://gist.github.com/takafumir/317b9325bebf677326b4
// Thanks, takafumir!!
import Foundation

class Regexp {
    let internalRegexp: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        do {
            self.internalRegexp = try NSRegularExpression(pattern: pattern, options: [])
        } catch let error as NSError {
            print(error.localizedDescription)
            self.internalRegexp = NSRegularExpression()
        }
    }
    
    func isMatch(_ input: String) -> Bool {
        let inputAsNSString = input as NSString
        let matches = self.internalRegexp.matches(
            in: input,
            options: [],
            range:NSMakeRange(0, inputAsNSString.length)
        )
        return matches.count > 0
    }
    
    func matches(_ input: String) -> [String]? {
        if self.isMatch(input) {
            let inputAsNSString = input as NSString
            let matches = self.internalRegexp.matches(
                in: input,
                options: [],
                range:NSMakeRange(0, inputAsNSString.length)
            )
            var results: [String] = []
            for i in 0 ..< matches.count {
                results.append( inputAsNSString.substring(with: matches[i].range) )
            }
            return results
        }
        return nil
    }
}
