import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P32 (**) Determine the greatest common divisor of two positive integer numbers.
    func testP32() {
        Test("Common divisor") {
            assertEquals(Int.gcd(36, 63), 9)
        }
    }

}
