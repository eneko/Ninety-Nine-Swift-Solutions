import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P24 (*) Lotto: Draw N different random numbers from the set 1..M.
    func testP24() {
        Test("Draw N different random numbers from the set 1..M.") {
            assertEquals(
                List<Int>.lotto(numbers: 6, maximum: 49).length,
                6
            )

            let list = List<Int>.range(from: 1, to: 49)
            List<Int>.lotto(numbers: 6, maximum: 49).forEach {
                assertEquals(list.contains($0), true)
            }
        }
    }

}
