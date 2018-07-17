import Foundation

public struct Solutions {

    public static func loadSolutions(username: String) -> [String] {
        let destination = "Solutions/\(username)/"
        let files = (try? FileManager.default.contentsOfDirectory(atPath: destination)) ?? []
        return files.filter { $0.hasSuffix(".swift") }.compactMap { $0.components(separatedBy: "_").first }.filter { $0.isEmpty == false }.sorted()
    }

    public static func createFolder(username: String) throws {
        let destination = "Solutions/\(username)/includes/"
        try? FileManager.default.removeItem(atPath: destination) // Fail if does not exist
        try FileManager.default.createDirectory(atPath: destination, withIntermediateDirectories: true, attributes: nil)
    }

    public static func writeMain(username: String, solutions: [String]) throws {
        let destination = "Solutions/\(username)/includes/main.swift"
        let tests = solutions.map { "tester.test\($0.uppercased())()" }.joined(separator: "\n")
        let main = """
        import Foundation
        import SolutionTester
        let tester = SolutionTester()
        \(tests)
        tester.showResults()
        exit(tester.exitCode)
        """
        let output = URL(fileURLWithPath: destination)
        try main.write(to: output, atomically: true, encoding: .utf8)
    }

}
