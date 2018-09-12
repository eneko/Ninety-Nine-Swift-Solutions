import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {
    
    // P09 (**) Pack consecutive duplicates of list elements into sublists.
    func testP09() {
        Test("Pack consecutive duplicates of list elements into sublists") {
            assertEquals(List("a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e").pack().description,
                        List(List("a", "a", "a", "a"), List("b"), List("c", "c"), List("a", "a"), List("d"), List("e", "e", "e", "e")).description)
            assertEquals(List(1, 1, 2, 3, 5, 8).pack().description, "[[1, 1], [2], [3], [5], [8]]")
            assertEquals(List("a").pack().description, List(List("a")).description)
        }
    }
    
}
