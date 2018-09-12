import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P08 (**) Eliminate consecutive duplicates of list elements.
    func testP08() {
        Test("Eliminate consecutive duplicates of list elements") {
            assertEquals(List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e").compress().description,
             List("a", "b", "c", "a", "d", "e").description)
            assertEquals(List(1, 1, 2, 3, 5, 8).compress().description, List(1, 2, 3, 5, 8).description)
            assertEquals(List("a").compress().description, List("a").description)
        }
    }

}
