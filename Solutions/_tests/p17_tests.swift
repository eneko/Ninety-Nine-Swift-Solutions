import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P17 (*) Split a list into two parts.
    func testP17() {
        Test("Split a list into two parts") {
            assertEquals(
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").split(at: 3).0?.description,
                List("a", "b", "c").description
            )
            assertEquals(
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").split(at: 3).1?.description,
                List("d", "e", "f", "g", "h", "i", "j", "k").description
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).split(at: 3).0?.description,
                "[1, 1, 2]"
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).split(at: 3).1?.description,
                "[3, 5, 8]"
            )
            assertEquals(
                List("a").split(at: 3).0?.description,
                "[a]"
            )
            assertEquals(
                List("a").split(at: 3).1?.description,
                nil
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).split(at: 0).0?.description,
                nil
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).split(at: 0).1?.description,
                List(1, 1, 2, 3, 5, 8).description
            )
        }
    }

}
