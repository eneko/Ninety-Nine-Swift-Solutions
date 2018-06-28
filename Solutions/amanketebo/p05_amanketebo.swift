import NinetyNineSwiftProblems

extension List {
    func reverse() -> List {
        var current = self
        var reversed: List?

        while let nextItem = current.nextItem {
            let newItem = List(current.value)

            newItem.nextItem = reversed
            current = nextItem
            reversed = newItem
        }

        let newItem = List(current.value)
        newItem.nextItem = reversed

        return newItem
    }
}
