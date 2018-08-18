import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P22 (*) Create a list containing all integers within a given range.
    func testP22() {
        Test("Create a list containing all integers within a given range.") {
            assertEquals(
                List<Int>.range(from: 4, to: 9).description,
                List(4, 5, 6, 7, 8, 9).description
            )
        }
    }

}
