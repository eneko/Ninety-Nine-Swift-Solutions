import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P23 (**) Extract a given number of randomly selected elements from a list.
    func testP23() {
        Test("Extract a given number of randomly selected elements from a list.") {
            assertEquals(
                List("a", "b", "c", "d", "e", "f", "g", "h").randomSelect(amount: 3).length,
                3
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).randomSelect(amount: 3).length,
                3
            )
            assertEquals(
                List("a").randomSelect(amount: 3).length,
                1
            )
        }
    }
}
