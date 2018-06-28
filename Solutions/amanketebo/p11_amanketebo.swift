import NinetyNineSwiftProblems

extension List where T: Equatable {
    public func encodeModified() -> List<Any> {
        let packedList = self.pack()
        var current: List<List<T>>! = packedList
        var count = 0
        var encodedList: List<Any>!
        var lastEncodedElement: List<Any>!

        repeat {
            let innerList = current.value
            var currentInnerList: List<T>! = innerList
            let value = currentInnerList.value

            repeat {
                count += 1
                currentInnerList = currentInnerList.nextItem
            } while currentInnerList != nil

            let encodedElement: List<Any>!

            if count == 1 {
                encodedElement = List<Any>(value)
            } else {
                let tuple = List<Any>(count, value)
                encodedElement = List<Any>(tuple)
            }

            if encodedList == nil {
                encodedList = encodedElement
            } else {
                lastEncodedElement.nextItem = encodedElement
            }

            lastEncodedElement = encodedElement
            count = 0
            current = current.nextItem
        } while current != nil

        return encodedList!
    }
}
