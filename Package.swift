// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Locksmith",
    platforms: [
        .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        .library(
            name: "Locksmith",
            targets: ["Locksmith iOS", "Locksmith OS X", "Locksmith watchOS"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Locksmith iOS",
            exclude: ["instructions.md"],
            resources: [
                .process("text.txt"),
                .process("example.png"),
                .copy("settings.plist")
            ]
        ),
        .binaryTarget(
            name: "SomeRemoteBinaryPackage",
            url: "https://url/to/some/remote/binary/package.zip",
            checksum: "The checksum of the XCFramework inside the ZIP archive."
        ),
        .binaryTarget(
            name: "SomeLocalBinaryPackage",
            path: "path/to/some.xcframework"
        )
        .testTarget(
            name: "MyLibraryTests",
            dependencies: ["MyLibrary"]),
    ]
)
