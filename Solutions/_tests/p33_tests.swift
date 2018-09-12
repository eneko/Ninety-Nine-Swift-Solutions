import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P33 (*) Determine whether two positive integer numbers are coprime.
    func testP33() {
        Test("Coprimes") {
            assertEquals(35.isCoprimeTo(other: 64), true)
        }
    }

}
