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
    ],
    targets: [
        .target(
            name: "StackKit",
            dependencies: []),
        .testTarget(
            name: "StackKitTests",
            dependencies: ["StackKit"]),
    ]
)
