// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let remoteDependencies: [PackageDescription.Package.Dependency] = [
    .package(url: "https://github.com/oversizedev/OversizeLocalizable.git", .upToNextMajor(from: "1.5.0")),
]

let localDependencies: [PackageDescription.Package.Dependency] = [
    .package(name: "OversizeLocalizable", path: "../OversizeLocalizable"),
]

var dependencies: [PackageDescription.Package.Dependency] = remoteDependencies

if ProcessInfo.processInfo.environment["BUILD_MODE"] == "DEV" {
    dependencies = localDependencies
}

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
    dependencies: dependencies,
    targets: [
        .target(
            name: "OversizeModels",
            dependencies: [
                .product(name: "OversizeLocalizable", package: "OversizeLocalizable"),
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "OversizeModelsTests",
            dependencies: ["OversizeModels"]
        ),
    ]
)
