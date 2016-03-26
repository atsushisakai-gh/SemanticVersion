// : Playground - noun: a place where people can play

import Cocoa

var pre1: [String?] = ["alpha", nil]
var pre2: [String?] = ["alpha", "1"]

// 1.0.0-alpha < 1.0.0-alpha.1
// 数字が存在するほうがおおきい
pre1[0] == pre2[0]

switch (pre1[1], pre2[1]) {
case (.Some, .Some):
    break
case (.Some, .None):
    break
case (.None, .Some):
    break
case (.None, .None):
    break
}

"alpha" < "beta"

var grid2 = Array<String?>(count: 16, repeatedValue: nil);

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

    func isMatch(input: String) -> Bool {
        let inputAsNSString = input as NSString
        let matches = self.internalRegexp.matchesInString(
            input,
            options: [],
            range: NSMakeRange(0, inputAsNSString.length)
        )
        return matches.count > 0
    }

    func matches(input: String) -> [String]? {
        if self.isMatch(input) {
            let inputAsNSString = input as NSString
            let matches = self.internalRegexp.matchesInString(
                input,
                options: [],
                range: NSMakeRange(0, inputAsNSString.length)
            )
            var results: [String] = []
            for i in 0 ..< matches.count {
                results.append(inputAsNSString.substringWithRange(matches[i].range))
            }
            return results
        }
        return nil
    }
}

Regexp("^([0-9]+)$").isMatch("1")
