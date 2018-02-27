extension List {
    /** P08 (**) Eliminate consecutive duplicates of linked list elements.
     - returns: List<T>
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity:
     - difficulty: 2/3
     */
    func compress() -> List<T> {
        var currentNode: List<T>? = self
        var array = [T]()
        while currentNode != nil {
            if array.isEmpty || ((array.last != nil) && (array.last! != currentNode?.value)) {
                array.append(currentNode!.value)
            }
            currentNode = currentNode!.nextItem
        }
        
        
        return List(array)!
    }
}
