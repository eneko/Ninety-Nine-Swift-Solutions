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
            if validate(queens: queens) == false {
                assertFailure("Invalid queens solution: \(queens.description)")
            }
            else {
                assertSuccess("Valid queens solution: \(queens.description)")
            }
        }
    }

    private func validate(queens: List<Int>) -> Bool {
        // Validate we have eight queens
        guard queens.length == 8 else {
            return false
        }

        // Columns are unique since we are using a List (only one queen per column)

        // Validate rows are unique
        for index in 0...7 {
            let pair = queens.remove(at: index)
            if pair.rest?.contains(pair.removed!) == true {
                return false
            }
        }

        // Validate rows are in range
        for index in 0...7 {
            if (1...8).contains(queens[index]!) == false {
                return false
            }
        }

        // Validate diagonals
        for (queenColumn, queenRow) in queens.enumerated() {
            for column in 0...7 where column != queenColumn {
                let normalizedQueenRow = queenRow - 1
                let targetQueenRow = queens.get(at: column)! - 1
                if targetQueenRow == normalizedQueenRow - abs(queenColumn - column) ||
                    targetQueenRow == normalizedQueenRow + abs(queenColumn - column) {
                    return false
                }
            }
        }

        return true
    }

}
