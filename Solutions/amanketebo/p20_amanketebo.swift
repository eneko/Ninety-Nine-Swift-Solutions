import NinetyNineSwiftProblems

extension List {
    func remove(at position: Int) -> (rest: List?, removed: T?) {
        let list: List? = self
        var current: List? = self
        var currentPosition = 0
        var removed: T?

        if position == 0 {
            return (list?.nextItem, current?.value)
        }

        while let _ = current?.value {
            if currentPosition + 1 == position {
                removed = current?.nextItem?.value
                current?.nextItem = current?.nextItem?.nextItem

                return (list, removed)
            }

            currentPosition += 1
            current = current?.nextItem
        }

        return (list, removed)
    }
}
