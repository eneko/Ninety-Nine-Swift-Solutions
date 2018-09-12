import Foundation

public class Tree<T> { //}: CustomStringConvertible {
    let value: T
    var left: Tree<T>?
    var right: Tree<T>?

    public init(_ value: T, _ left: Tree<T>? = nil, _ right: Tree<T>? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }

//    public var description: String {
//        if left != nil && right != nil {
//            return "T(\(value) \(left!) \(right!))"
//        } else if left != nil {
//            return "T(\(value) \(left!) .)"
//        } else if right != nil {
//            return "T(\(value) . \(right!))"
//        }
//        return "T(\(value) . .)"
//    }
}

public class PositionedTree<T>: Tree<T> {
    var column: Int
    var row: Int

    public init(_ value: T, _ left: Tree<T>? = nil, _ right: Tree<T>? = nil, column: Int, row: Int) {
        self.column = column
        self.row = row
        super.init(value, left, right)
    }

//    override public var description: String {
//        let position = "T[\(column),\(row)]"
//        let tree = super.description
//        return position + tree[tree.index(after: tree.startIndex)...]
//    }
}
