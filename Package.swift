// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "RxCraft",
  platforms: [SupportedPlatform.iOS(.v11)],
  products: [.library(name: "RxCraft", targets: ["RxCraft"])],
  dependencies: [],
  targets: [.target(name: "RxCraft", dependencies: [], path: "Sources/RxCraft")],
  swiftLanguageVersions: [.v5]
)
