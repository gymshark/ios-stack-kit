// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SharkStackKit",
    platforms: [ .iOS(.v12)],
    products: [
        .library(
            name: "SharkStackKit",
            targets: ["SharkStackKit"]),
    ],
    dependencies: [
        .package(
            name: "SharkUtils",
            url: "git@github.com:gymshark/ios-Shark-Utils.git",
            .upToNextMinor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "SharkStackKit",
            dependencies: ["SharkUtils"]),
        .testTarget(
            name: "SharkStackKitTests",
            dependencies: ["SharkStackKit"]),
    ]
)
