import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P21 (*) Insert an element at a given position into a list.
    func testP21() {
        Test("Insert an element at a given position into a list") {
            assertEquals(
                List("a", "b", "c", "d").insert(at: 1, value: "new").description,
                List("a", "new", "b", "c", "d").description
            )
            assertEquals(
                List<Any>(1, 1, 2, 3, 5, 8).insert(at: 1, value: "new").description,
                List<Any>(1, "new", 1, 2, 3, 5, 8).description
            )
            assertEquals(
                List("a").insert(at: 1, value: "new").description,
                List("a", "new").description
            )
        }
    }

}
