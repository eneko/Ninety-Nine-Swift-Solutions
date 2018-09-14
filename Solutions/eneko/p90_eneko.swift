import Foundation
import NinetyNineSwiftProblems

extension MiscellaneousProblems {

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
    static func eightQueens() -> List<Int> {
        // return List(1, 2, 3, 4, 5, 6, 7, 8)
        // return List(4, 2, 7, 3, 6, 8, 5, 1)
        var list = List(1, 2, 3, 4, 5, 6, 7, 8).randomPermute()
        while verify(queens: list) == false {
            list = list.randomPermute()
        }
        return list
    }

    static func verify(queens: List<Int>) -> Bool {
        for queenColumn in 1...8 {
            let queenRow = queens[queenColumn-1] ?? 0
            for targetColumn in 1...8 where targetColumn != queenColumn {
                let targetRow = queens[targetColumn-1] ?? 0
                if targetRow == queenRow - abs(queenColumn - targetColumn) ||
                    targetRow == queenRow + abs(queenColumn - targetColumn) {
                    return false
                }
            }
        }
        return true
    }

}
