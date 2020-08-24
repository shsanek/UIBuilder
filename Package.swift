// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIBuilder",
    products: [
        .library(
            name: "UIBuilder",
            targets: ["UIBuilder"]),
    ],
    targets: [
        .target(
            name: "UIBuilder",
            dependencies: [])
    ]
)
