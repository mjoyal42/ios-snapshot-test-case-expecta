// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Expecta+Snapshots",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ExpectaSnapshots",
            targets: ["ExpectaSnapshots"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/mediamonks/ios-snapshot-test-case.git", from: "2.2.3"),
        .package(url: "https://github.com/hudl/expecta.git", branch: "spm"),
        .package(url: "https://github.com/mjoyal42/specta.git", branch: "spm-support")
    ],
    targets: [
        .target(
            name: "ExpectaSnapshots",
            dependencies: [
                .product(name: "FBSnapshotTestCase", package: "ios-snapshot-test-case"),
                .product(name: "Expecta", package: "expecta"),
                .product(name: "Specta", package: "specta")
            ],
            path: ".",
            exclude: [
                "FBSnapshotTestCaseDemo"
            ],
            sources: [
                "EXPMatchers+FBSnapshotTest.m",
                "ExpectaObject+FBSnapshotTest.m"
            ],
            publicHeadersPath: "."
        )
    ]
)
