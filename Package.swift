// swift-tools-version:4.2
import PackageDescription
import Foundation

let products: [Product] = [
    .executable(name: "test", targets: ["test"]),
    .executable(name: "setup", targets: ["setup"]),
    .library(name: "Command", targets: ["Command"]),
    .library(name: "NinetyNineSwiftProblems", targets: ["NinetyNineSwiftProblems"]),
    .library(name: "SolutionTester", targets: ["SolutionTester"])
]

let packageDependencies: [PackageDescription.Package.Dependency] = [
    .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.1.0"),
    .package(url: "https://github.com/onevcat/Rainbow", from: "3.0.0"),
    .package(url: "https://github.com/eneko/Logger", from: "0.0.0"),
]

let targetDependencies: [Target.Dependency] = [
	"Command", "NinetyNineSwiftProblems", "SolutionTester", "Utility", "Logger"
]

let defaultTargets: [Target] = [
    .target(name: "Command", dependencies: ["Utility", "Logger"]),
    .target(name: "NinetyNineSwiftProblems", dependencies: []),
    .target(name: "SolutionTester", dependencies: ["Command", "NinetyNineSwiftProblems", "Rainbow", "Utility"]),
    .target(name: "runner", dependencies: targetDependencies),
    .target(name: "setup", dependencies: ["Command", "NinetyNineSwiftProblems", "SolutionTester", "Rainbow", "Utility"]),
    .target(name: "test", dependencies: targetDependencies),
]

var userTargets: [Target] {
    var usernames = (try? FileManager.default.contentsOfDirectory(atPath: "Solutions")) ?? []
    usernames = usernames.filter { $0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false }
        .filter { $0.hasPrefix(".") == false }
        .filter { $0 != "_tests" }
    return usernames.map { Target.target(name: $0, dependencies: targetDependencies, path: "Solutions/\($0)") }
}

let package = Package(name: "NinetyNineSwiftSolutions",
                      products: products,
                      dependencies: packageDependencies,
                      targets: defaultTargets + userTargets)
