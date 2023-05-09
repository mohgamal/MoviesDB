// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoviesDBCore",
    platforms: [ .iOS(.v13)],
    products: [
        .library(
            name: "MoviesDBCore",
            targets: ["MoviesDBCore"]),
        .library(name: "MoviesDBDomain",
                 targets: ["MoviesDBDomain"]),
        .library(name: "MoviesDBData",
                 targets: ["MoviesDBData"]),
        .library(name: "MoviesDBPresentation",
                 targets: ["MoviesDBPresentation"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MoviesDBCore",
            dependencies: ["MoviesDBDomain",
                           "MoviesDBData",
                           "MoviesDBPresentation"]),
        .target(name: "MoviesDBDomain",
                dependencies: []),
        .target(name: "MoviesDBData",
                dependencies: ["MoviesDBDomain"]),
        .target(name: "MoviesDBPresentation",
                dependencies: ["MoviesDBDomain"]),
        .testTarget(
            name: "MoviesDBCoreTests",
            dependencies: ["MoviesDBCore"]),
    ]
)
