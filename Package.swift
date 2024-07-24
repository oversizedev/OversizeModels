// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let remoteDependencies: [PackageDescription.Package.Dependency] = [
    .package(url: "https://github.com/oversizedev/OversizeLocalizable.git", .upToNextMajor(from: "1.5.0")),
]

let localDependencies: [PackageDescription.Package.Dependency] = [
    .package(name: "OversizeLocalizable", path: "../OversizeLocalizable"),
]

var dependencies: [PackageDescription.Package.Dependency] = localDependencies

if ProcessInfo.processInfo.environment["BUILD_MODE"] == "PRODUCTION" {
    dependencies = remoteDependencies
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
