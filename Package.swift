// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "STPopup",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "STPopup",
            targets: ["STPopup"]),
    ],
    targets: [
        .target(
            name: "STPopup",
            path: "STPopup",
            publicHeadersPath: ""
        ),
    ]
)
