// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

/// Created by nipun Weerakkodi on 31.07.24.


import PackageDescription

let package = Package(
    name: "AnyCodable",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AnyCodable",
            targets: ["AnyCodable"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AnyCodable"),
        .testTarget(
            name: "AnyCodableTests",
            dependencies: ["AnyCodable"]),
    ]
)
