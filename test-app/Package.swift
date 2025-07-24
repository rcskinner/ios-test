// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "test-app",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "test-app",
            targets: ["test-app"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Datadog/dd-sdk-ios.git", .upToNextMajor(from: "2.0.0"))
    ],
    targets: [
        .target(
            name: "test-app",
            dependencies: [
                .product(name: "Datadog", package: "dd-sdk-ios")
            ],
            path: "test-app/test-app"
        ),
        .testTarget(
            name: "test-appTests",
            dependencies: ["test-app"],
            path: "test-app/test-appTests"
        ),
    ]
) 