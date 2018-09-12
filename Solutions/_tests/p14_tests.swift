import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P14 (*) Duplicate the elements of a list.
    func testP14() {
        Test("Duplicate the elements of a list") {
            assertEquals(
                List("a", "b", "c", "c", "d").duplicate().description,
                List("a", "a", "b", "b", "c", "c", "c", "c", "d", "d").description
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).duplicate().description,
                List(1, 1, 1, 1, 2, 2, 3, 3, 5, 5, 8, 8).description
            )
            assertEquals(List("a").duplicate().description, List("a", "a").description)
        }
    }

}
