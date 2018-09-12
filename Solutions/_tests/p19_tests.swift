import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P19 (**) Rotate a list N places to the left.
    func testP19() {
        Test("Rotate a list N places to the left") {
            assertEquals(
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").rotate(amount: 3).description,
                List("d", "e", "f", "g", "h", "i", "j", "k", "a", "b", "c").description
            )
            assertEquals(
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").rotate(amount: 11).description,
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").description
            )
            assertEquals(
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").rotate(amount: 0).description,
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").description
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).rotate(amount: 3).description,
                List(3, 5, 8, 1, 1, 2).description
            )
            assertEquals(
                List("a").rotate(amount: 3).description,
                List("a").description
            )
            assertEquals(
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").rotate(amount: -2).description,
                List("j", "k", "a", "b", "c", "d", "e", "f", "g", "h", "i").description
            )
            assertEquals(
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").rotate(amount: -11).description,
                List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").description
            )
            assertEquals(
                List(1, 1, 2, 3, 5, 8).rotate(amount: -2).description,
                List(5, 8, 1, 1, 2, 3).description
            )
            assertEquals(
                List("a").rotate(amount: -2).description,
                List("a").description
            )
        }
    }

}
