extension List {
    /** P04 (*) Find the number of elements of a linked list.
     - returns: Int the number of elements of a linked list
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity: O(n)
     - difficulty: 1/3
     */
    var length: Int {
        var length = 1 // Starts with 1 since we can't have an empty List<T>
        var currentNode = self
        while (currentNode.nextItem != nil) {
            length += 1
            currentNode = currentNode.nextItem!
        }
        return length
    }
}
