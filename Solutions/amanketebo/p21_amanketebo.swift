import NinetyNineSwiftProblems

extension List {
    func insert(at index: Int, value: T) -> List {
        var current: List? = self
        var currentPosition = 0

        if index == currentPosition {
            let element = List<T>(value)

            element.nextItem = self
            return element
        }

        while let _ = current?.value {
            let nextItem = current?.nextItem

            if currentPosition + 1 == index {
                let element = List<T>(value)

                current?.nextItem = element
                element.nextItem = nextItem
                return self
            }

            currentPosition += 1
            current = nextItem
        }

        return self
    }
}
