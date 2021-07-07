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
        .package(name: "ConstraintKit", url: "git@github.com:gymshark/constraint-kit.git", .exact(Version("0.0.1")))
    ],
    targets: [
        .target(
            name: "SharkStackKit",
            dependencies: ["ConstraintKit"]),
        .testTarget(
            name: "SharkStackKitTests",
            dependencies: ["SharkStackKit", "ConstraintKit"]),
    ]
)
