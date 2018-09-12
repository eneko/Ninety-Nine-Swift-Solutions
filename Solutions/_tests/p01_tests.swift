import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P01 (*) Find the last element of a list.
    func testP01() {
        Test("Find last element") {
            assertEquals(TestData.singleElementList.last, 1)
            assertEquals(TestData.twoElementList.last, 2)
            assertEquals(TestData.multiElementList.last, 21)
            assertEquals(TestData.veryLongList.last, 1000)
        }
    }

}
