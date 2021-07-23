// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StackKit",
    platforms: [ .iOS(.v12)],
    products: [
        .library(
            name: "StackKit",
            targets: ["StackKit"]),
    ],
    dependencies: [
        .package(name: "ConstraintKit",
                 url: "git@github.com:gymshark/ios-constraint-kit.git",
                 .upToNextMinor(from: "0.0.2"))
    ],
    targets: [
        .target(
            name: "StackKit",
            dependencies: ["ConstraintKit"]),
        .testTarget(
            name: "StackKitTests",
            dependencies: ["StackKit"]),
    ]
)
