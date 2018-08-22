import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    // P24 (*) Lotto: Draw N different random numbers from the set 1..M.
    func testP24() {
        func forEachElement(in list: List<Int>, _ each: (Int) -> Void) {
            var current: List? = list
            while let value = current?.value {
                each(value)
                current = current?.nextItem
            }
        }

        func contains(_ value: Int, in list: List<Int>) -> Bool {
            var current: List? = list
            while let currentValue = current?.value {
                if currentValue == value {
                    return true
                }
                current = current?.nextItem
            }
            return false
        }

        Test("Draw N different random numbers from the set 1..M.") {
            assertEquals(
                List<Int>.lotto(numbers: 6, maximum: 49).length,
                6
            )
            let list = List<Int>.range(from: 1, to: 49)
            let lottoList = List<Int>.lotto(numbers: 6, maximum: 49)

            forEachElement(in: lottoList) {
                assertEquals(contains($0, in: list), true)
            }
        }
    }

}
