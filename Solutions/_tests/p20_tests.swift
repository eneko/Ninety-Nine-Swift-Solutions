import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P20 (*) Remove the Kth element from a list.
    func testP20() {
        Test("Remove the Kth element from a list.") {
            assertEquals(
                List("a", "b", "c", "d").remove(at: 1).0?.description,
                List("a", "c", "d").description
            )
            assertEquals(
                List("a", "b", "c", "d").remove(at: 1).1,
                "b"
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).remove(at: 1).0?.description,
                List(1, 2, 3, 5, 8).description
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).remove(at: 1).1,
                1
            )
            assertEquals(
                List("a").remove(at: 1).0?.description,
                List("a").description
            )
            assertEquals(
                List("a").remove(at: 1).1,
                nil
            )

            // Test to make sure original list isn't altered
            let list = List("a", "b", "c", "d")
            let first = list.remove(at: 1)
            assertEquals(first.1, "b")
            assertEquals(
                list.description,
                List("a", "b", "c", "d").description
            )
        }
    }

}
