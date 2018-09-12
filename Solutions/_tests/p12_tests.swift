import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {
    
    // P12 (**) Decode a run-length encoded list.
    func testP12() {
        Test("Decode a run-length encoded list") {
            assertEquals(
                List((4, "a"), (1, "b"), (2, "c"), (2, "a"), (1, "d"), (4, "e")).decode(),
                List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e")
            )
        }
    }
    
}
