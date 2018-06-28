import NinetyNineSwiftProblems

extension List {
    func duplicate(times: Int) -> List {
        var current: List<T>? = self

        repeat {
            let nextItem = current!.nextItem
            var lastPlacedElement = current!

            for i in 0..<times-1 {
                let newElement = List(current!.value)

                if i+1 == times-1 {
                    newElement.nextItem = nextItem
                }

                lastPlacedElement.nextItem = newElement
                lastPlacedElement = newElement
            }

            current = nextItem
        } while current != nil

        return self
    }
}
