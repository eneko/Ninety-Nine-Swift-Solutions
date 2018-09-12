import NinetyNineSwiftProblems
import SolutionTester

extension SolutionTester {

    /// P90 (**) Eight queens problem.
    ///
    /// This is a classical problem in computer science. The objective is to place
    /// eight queens on a chessboard so that no two queens are attacking each
    /// other; i.e., no two queens are in the same row, the same column, or on
    /// the same diagonal.
    ///
    /// Hint: Represent the positions of the queens as a list of numbers 1..n.
    /// Example: `List(4, 2, 7, 3, 6, 8, 5, 1)` means that the queen in the first
    /// column is in row 4, the queen in the second column is in row 2, etc.
    /// Use the generate-and-test paradigm.
    func testP90() {
        Test("Eight queens problem") {
            let queens = MiscellaneousProblems.eightQueens()
            validate(queens: queens)
        }
    }

    private func validate(queens: List<Int>) {
        // Validate we have eight queens
        assertEquals(queens.length, 8)

        // Columns are unique since we are using a List (only one queen per column)

        // Validate rows are unique
        for index in 0...7 {
            let pair = queens.remove(at: index)
            assertEquals(pair.rest?.contains(pair.removed!), false)
        }

        // Validate diagonals
        for (queenColumn, queenRow) in queens.enumerated() {
            for row in 0...7 {
//                assertEquals(queens.get(at: ), <#T##isEqualTo: Equatable?##Equatable?#>)
            }
        }
    }

}
