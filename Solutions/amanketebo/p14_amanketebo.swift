import NinetyNineSwiftProblems

extension List {
    func duplicate() -> List {
        var current: List<T>? = self

        repeat {
            let saved = current!.nextItem
            let element = List<T>(current!.value)

            current!.nextItem = element
            element.nextItem = saved
            current = saved
        } while current != nil

        return self
    }
}
