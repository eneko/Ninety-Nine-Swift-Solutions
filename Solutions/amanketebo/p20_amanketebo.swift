import NinetyNineSwiftProblems

extension List {
    func remove(at position: Int) -> (rest: List?, removed: T?) {
        var list: List!
        var listLastElement: List?
        var current: List? = self
        var currentPosition = 0
        var removed: T?

        if position == 0 {
            return (list?.nextItem, current?.value)
        }

        while let value = current?.value {
            if currentPosition == position {
                removed = value
            } else {
                let element = List<T>(value)

                if list == nil {
                    list = element
                } else {
                    listLastElement?.nextItem = element
                }
                listLastElement = element
            }

            currentPosition += 1
            current = current?.nextItem
        }

        return (list, removed)
    }
}
