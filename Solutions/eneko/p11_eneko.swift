import NinetyNineSwiftProblems

extension List where T: Equatable {
    /// P11 (*) Modified run-length encoding.
    /// - complexity: O(n)
    public func encodeModified() -> List<Any> {
        let packed = pack()
        var resultList: List<Any>!
        var resultListLast: List<Any>!
        var current: List<List<T>>? = packed
        while let value = current?.value {
            let count = value.length
            let value = value.value
            var newItem: List<Any>!
            if count == 1 {
                newItem = List<Any>(value)
            } else {
                let pack = (count, value)
                newItem = List<Any>(pack)
            }
            if resultList == nil {
                resultList = newItem
            } else {
                resultListLast.nextItem = newItem
            }
            resultListLast = newItem
            current = current?.nextItem
        }
        return resultList
    }
}
