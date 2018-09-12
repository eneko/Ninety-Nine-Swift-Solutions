import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P11 (*) Modified run-length encoding.
    func testP11() {
        Test("Modified run-length encoding") {
            assertEquals(
                List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e").encodeModified().description,
                List<Any>(List<Any>(4, "a"), "b", List<Any>(2, "c"), List<Any>(2, "a"), "d", List<Any>(4, "e")).description
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).encodeModified().description,
                List<Any>(List<Any>(2, 1), 2, 3, 5, 8).description
            )
            assertEquals(List("a").encodeModified().description, List("a").description)
        }
    }

}
