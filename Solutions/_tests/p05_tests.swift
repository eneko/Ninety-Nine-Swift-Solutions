import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P05 (*) Reverse a list.
    func testP05() {
        Test("Reverse a list") {
            verify(list: TestData.singleElementList, reversed: TestData.singleElementList.reverse())
            verify(list: TestData.twoElementList, reversed: TestData.twoElementList.reverse())
            verify(list: TestData.multiElementList, reversed: TestData.multiElementList.reverse())
            verify(list: TestData.veryLongList, reversed: TestData.veryLongList.reverse())
        }
    }

    private func verify(list: List<Int>, reversed: List<Int>) {
        assertEquals(list.length, reversed.length)
        let lastIndex = list.length - 1
        for i in 0...lastIndex {
            assertEquals(list.get(at: i) as Int?, reversed.get(at: lastIndex - i) as Int?)
        }
    }

}
