
import PackageDescription

let package = Package(
        name: "Texstyle",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SNASA",
            targets: ["SNASA"]),
    ],
    targets: [
        .target(name: "SNASA", path: "SNASA/SNASA"),
        .testTarget(
            name: "SNASATests",
            dependencies: ["SNASA"],
            path: "SNASA/SNASATests"),
    ]
)
