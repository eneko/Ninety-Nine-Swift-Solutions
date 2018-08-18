import NinetyNineSwiftProblems

extension List {
    //P18 (**) Extract a slice from a linked list.
    public func slice(from: Int, to: Int) -> List? {
        var resultHead: List!
        var resultTail: List!
        var iterator = self as List?
        var count = 0
        while let value = iterator?.value {
            if count >= from {
                let node = List(value)
                resultHead == nil ? (resultHead = node) : (resultTail?.nextItem = node)
                resultTail = node
            }
            count += 1
            guard count < to else { break }
            iterator = iterator?.nextItem
        }
        return resultHead
    }
}
