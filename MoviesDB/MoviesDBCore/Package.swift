// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoviesDBCore",
    platforms: [ .iOS(.v14)],
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
        .package(url: "https://github.com/markiv/SwiftUI-Shimmer.git", from: "1.0.0"),
        .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", from: "2.0.0")
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
                dependencies: ["MoviesDBDomain",
                               .product(name: "Shimmer", package: "SwiftUI-Shimmer"),
                               .product(name: "SDWebImageSwiftUI", package: "SDWebImageSwiftUI")],
                resources: [.copy("Resources/retry.gif")]),
        .testTarget(
            name: "MoviesDBCoreTests",
            dependencies: ["MoviesDBCore"]),
    ]
)
