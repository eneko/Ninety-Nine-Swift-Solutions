import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P10 (*) Run-length encoding of a list.
    func testP10() {
        Test("Run-length encoding of a list") {
            assertEquals(
                List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e").encode().description,
                List((4, "a"), (1, "b"), (2, "c"), (2, "a"), (1, "d"), (4, "e")).description
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).encode().description,
                List((2, 1), (1, 2), (1, 3), (1, 5), (1, 8)).description
            )
            assertEquals(List("a").encode().description, List((1, "a")).description)
        }
    }

}
