# SemanticVersion

`SemanticVersion` is a simple library for SemantiVersion Swift. `SemanticVersion` is implemented Equatable/Comparable operator.

## About SemanticVersion

[http://semver.org/]()

## Installation

Write to Cartfile the following line.

```
github "radioboo/SemanticVersion"
```

You can install with Carthage command.

```zsh
$ carthage update
```

## Usage

Please read my test code, you can understand the more specific usage.

```swift
// Example
let versionA = SemanticVersion("1.0.0")
let versionB = SemanticVersion("2.0.0")

versionA == versionB // false
versionA != versionB // true
versionA <  versionB // true
versionA <= versionB // true
versionA >  versionB // false
versionA >= versionB // false
```

## TODO

- [ ] Implement for `prelease version`

## Author

SAKAI, Atsushi, sakai.atsushi@gmail.com

## License

`SemanticVersion` is available under the MIT license. See the LICENSE file for more info.
