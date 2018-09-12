import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P07 (**) Flatten a nested list structure.
    func testP07() {
        Test("Flatten a nested list structure") {
            assertEquals(List<Any>(List<Any>(1, 1), 2, List<Any>(3, List<Any>(5, 8))).flatten().description, "[1, 1, 2, 3, 5, 8]")
            assertEquals(List(1, 1, 2, 3, 5, 8).flatten().description, "[1, 1, 2, 3, 5, 8]")
            assertEquals(List<Any>(List<Any>(List<Any>(List<Any>(List<Any>(1), List<Any>(2), List<Any>(3, 4))))).flatten().description, "[1, 2, 3, 4]")
        }
    }

}
