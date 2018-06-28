import NinetyNineSwiftProblems

extension List where T: Equatable {
    public func encode() -> List<(Int, T)> {
        let packedList = self.pack()
        var current: List<List<T>>! = packedList
        var count = 0
        var encodedList: List<(Int,T)>!
        var lastEncodedElement: List<(Int,T)>!

        repeat {
            let innerList = current.value
            var currentInnerList: List<T>! = innerList
            let value = currentInnerList.value

            repeat {
                count += 1
                currentInnerList = currentInnerList.nextItem
            } while currentInnerList != nil

            let encodedElement = List<(Int, T)>((count, value))

            if encodedList == nil {
                encodedList = encodedElement
            } else {
                lastEncodedElement.nextItem = encodedElement
            }

            lastEncodedElement = encodedElement
            count = 0
            current = current.nextItem
        } while current != nil

        return encodedList
    }
}
