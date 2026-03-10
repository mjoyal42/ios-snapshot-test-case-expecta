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
        .package(url: "https://github.com/facebook/ios-snapshot-test-case.git", "2.2.3"..<"9.0.0"),
        .package(url: "https://github.com/specta/expecta.git", from: "1.0.0"),
        .package(url: "https://github.com/specta/specta.git", from: "2.0.0")
    ],
    targets: [
        .target(
            name: "ExpectaSnapshots",
            dependencies: [
                .product(name: "iOSSnapshotTestCase", package: "ios-snapshot-test-case"),
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
