// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let productionDependencies: [PackageDescription.Package.Dependency] = [
    .package(url: "https://github.com/oversizedev/OversizeLocalizable.git", .upToNextMajor(from: "1.5.0")),
]

let developmentDependencies: [PackageDescription.Package.Dependency] = [
    .package(name: "OversizeLocalizable", path: "../OversizeLocalizable"),
]

let package = Package(
    name: "OversizeModels",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v9),
    ],
    products: [
        .library(
            name: "OversizeModels",
            targets: ["OversizeModels"]
        ),
    ],
    dependencies: productionDependencies,
    targets: [
        .target(
            name: "OversizeModels",
            dependencies: [
                .product(name: "OversizeLocalizable", package: "OversizeLocalizable"),
            ]
        ),
        .testTarget(
            name: "OversizeModelsTests",
            dependencies: ["OversizeModels"]
        ),
    ]
)
