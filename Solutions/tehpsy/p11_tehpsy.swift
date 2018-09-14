import NinetyNineSwiftProblems

extension List where T: Equatable {

    /// P11 (*) Encodes a List
    /// - returns: New List in which repeated elements of more than 1 occurence are replaced with tuples
    //             tuples whose first element indicates the number of repetitions and second indicates
    //             the element to repeat
    /// - author: James Baxter (jimmehb@gmail.com)
    /// - complexity: O(n)
    func encodeModified() -> List<(Any)> {

        var resultHead: List<Any>?
        var resultTail: List<Any>?
        var sublistHead: List<T>?
        var sublistTail: List<T>?

        var current: List<T>? = self
        repeat {

            let nextSublistItem = List(current!.value)
            if sublistHead == nil {
                sublistHead = nextSublistItem
            } else {
                sublistTail?.nextItem = nextSublistItem
            }
            
            sublistTail = nextSublistItem

            let reachedEndOfOriginalList = current!.nextItem == nil
            let runningValueChanged = current!.nextItem?.value != sublistTail?.value

            if reachedEndOfOriginalList || runningValueChanged {

                let sublistLength = sublistHead!.length

                let newItem = sublistLength == 1 ?
                    List<Any>(sublistTail!.value) :
                    List<Any>((sublistHead!.length, sublistTail!.value))

                if resultHead == nil {
                    resultHead = newItem
                } else {
                    resultTail?.nextItem = newItem
                }

                resultTail = newItem

                sublistHead = nil
                sublistTail = nil
            }

            current = current?.nextItem
        } while current != nil

        return resultHead!
    }
}
