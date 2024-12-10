// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ThemeChangerModule",
    platforms: [
        .iOS(.v16),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "ThemeChangerModule",
            targets: ["ThemeChangerModule"]),
    ],
    targets: [
        .target(
            name: "ThemeChangerModule"),
    ]
)
