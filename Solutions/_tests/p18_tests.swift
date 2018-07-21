import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P18 (**) Extract a slice from a list.
    func testP18() {
        Test("Extract a slice from a list.") {
            assertEquals(
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").slice(from: 3, to: 7)?.description,
                List("d", "e", "f", "g").description
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).slice(from: 3, to: 7)?.description,
                List(3, 5, 8).description
            )
            assertEquals(
                List("a").slice(from: 3, to: 7)?.description,
                nil
            )
        }
    }

}
