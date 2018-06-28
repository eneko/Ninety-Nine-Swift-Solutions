import NinetyNineSwiftProblems

extension List {
    func split(at splitIndex: Int) -> (left: List?, right: List?) {
        if splitIndex == 0 {
            return (nil, self)
        }

        var current: List<T>? = self
        var index = 1
        var secondList: List<T>?

        repeat {
            if index == splitIndex {
                secondList = current!.nextItem
                current!.nextItem = nil
            }

            current = current!.nextItem
            index += 1
        } while current != nil

        return (self, secondList)
    }
}
