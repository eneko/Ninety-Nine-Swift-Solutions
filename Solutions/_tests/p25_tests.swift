import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P25 (*) Generate a random permutation of the elements of a list.
    func testP25() {
        Test("Generate a random permutation of the elements of a list") {
            let l1 = List("a", "b", "c", "d", "e", "f")
            l1.randomPermute().forEach {
                assertEquals(l1.contains($0), true)
            }
            let l2 = List(1, 1, 2, 3, 5, 8)
            l2.randomPermute().forEach {
                assertEquals(l2.contains($0), true)
            }
            assertEquals(List("a").randomPermute(), List("a"))
        }
    }

}
