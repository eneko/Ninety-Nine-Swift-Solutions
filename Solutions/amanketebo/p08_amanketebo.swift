import NinetyNineSwiftProblems

extension List where T: Equatable {
    func compress() -> List {
        let start = self
        var current = self

        while let nextItem = current.nextItem {
            var item = nextItem

            while current.value == item.value {
                if let itemNextItem = item.nextItem {
                    current.nextItem = itemNextItem
                    item = current.nextItem!
                } else {
                    if current.value == item.value {
                        current.nextItem = nil
                    }
                    break
                }
            }

            current = item
        }

        return start
    }
}
