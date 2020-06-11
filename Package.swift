// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "RxNavy",
    platforms: [
        .iOS(.v10),
    ],
    products: [
        .library(
            name: "RxNavy",
            targets: ["RxNavy"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ReactiveX/RxSwift.git",
            from: "5.0.0"),
        // Tests
        .package(
            url: "https://github.com/Quick/Quick.git",
            from: "2.0.0"),
        .package(
            url: "https://github.com/Quick/Nimble.git",
            from: "8.0.0"),
    ],
    targets: [
        .target(
            name: "RxNavy",
            dependencies: ["RxSwift", .product(name: "RxCocoa", package: "RxSwift")]),
        .testTarget(
            name: "RxNavyTests",
            dependencies: ["RxNavy", "Quick", "Nimble"]),
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
