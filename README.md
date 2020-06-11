# RxNavy

[![CI Status](https://img.shields.io/travis/lyzkov/RxNavy.svg?style=flat)](https://travis-ci.org/lyzkov/RxNavy)
[![Version](https://img.shields.io/cocoapods/v/RxNavy.svg?style=flat)](https://cocoapods.org/pods/RxNavy)
[![License](https://img.shields.io/cocoapods/l/RxNavy.svg?style=flat)](https://cocoapods.org/pods/RxNavy)
[![Platform](https://img.shields.io/cocoapods/p/RxNavy.svg?style=flat)](https://cocoapods.org/pods/RxNavy)

## Example

To run the example project, just open Example directory.

## Requirements

## Installation

### Swift Package Manager

Add this repo URL as a package dependency.

```swift
// swift-tools-version:5.2

import PackageDescription

let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/lyzkov/RxNavy.git", from: "0.1.0"),
    ],
    targets: [
        .target(
            name: "Your target",
            dependencies: ["RxNavy"]),
        )
    ],
    ...
)
```
### Cocoapods

RxNavy is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RxNavy'
```

## Author

lyzkov, lyzkov@gmail.com

## License

RxNavy is available under the MIT license. See the LICENSE file for more info.
