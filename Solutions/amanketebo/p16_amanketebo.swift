import NinetyNineSwiftProblems

extension List {
    func drop(every: Int) -> List? {
        if every <= 1 {
            return nil
        }

        var current: List<T>? = self
        var position = 1
        var previousElement: List<T>?

        repeat {
            if position % every == 0 {
                previousElement?.nextItem = current?.nextItem
            } else {
                previousElement = current
            }

            current = current?.nextItem
            position += 1
        } while current != nil

        return self
    }
}
