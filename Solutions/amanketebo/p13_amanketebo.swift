import NinetyNineSwiftProblems

extension List where T: Equatable {
    func encodeDirect() -> List<(Int, T)> {
        var current: List<T>? = self
        var count = 1
        var encodedList: List<(Int, T)>!
        var lastElement: List<(Int, T)>?

        repeat {
            let currentValue = current!.value
            let nextValue = current!.nextItem?.value

            if nextValue == nil || currentValue != nextValue {
                let element = List<(Int, T)>((count, currentValue))

                if encodedList == nil {
                    encodedList = element
                } else {
                    lastElement?.nextItem = element
                }

                lastElement = element

                count = 1
            } else if currentValue == nextValue {
                count += 1
            }

            current = current!.nextItem
        } while current != nil

        return encodedList
    }
}
