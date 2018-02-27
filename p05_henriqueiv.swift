extension List {
    /** P05 (*) Reverse a linked list.
     - returns: List<T> a list containing the elements in the reverse order
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity: O(n)
     - difficulty: 1/3
     */
    func reverse() -> List<T> {
        var currentNode = self
        var array = [value]
        while (currentNode.nextItem != nil) {
            currentNode = currentNode.nextItem!
            array.append(currentNode.value)
        }
        let reversedArray = Array<T>(array.reversed())
        return List(reversedArray)!
    }
}
