import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P16 (**) Drop every Nth element from a list.
    func testP16() {
        Test("Drop every Nth element from a list") {
            assertEquals(
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").drop(every: 3)?.description,
                List("a", "b", "d", "e", "g", "h", "j", "k").description
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).drop(every: 3)?.description,
                List(1, 1, 3, 5).description
            )
            assertEquals(List("a").drop(every: 3)?.description, List("a").description)
            assertEquals(List(1, 1, 2, 3, 5, 8).drop(every: 2)?.description, List(1, 2, 5).description)
            assertEquals(List(1, 1, 2, 3, 5, 8).drop(every: 1)?.description, nil)
            assertEquals(List(1, 1, 2, 3, 5, 8).drop(every: 0)?.description, nil)
            assertEquals(List(1, 1, 2, 3, 5, 8).drop(every: -1)?.description, nil)
        }
    }

}
