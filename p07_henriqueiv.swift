extension List {
    /** P07 (**) Flatten a nested linked list structure.
     - returns: List<T> the list flattened
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity: Varies according to nesting level
     - difficulty: 2/3
     */
    func flatten() -> List<T> {
        let array = dataFlatten()
        return List(array)!
    }
    
    private func dataFlatten() -> [T] {
        var result = [T]()
        var currentNode: List<T>? = self
        while (currentNode != nil) {
            if let listValue = currentNode!.value as? List<T> {
                result.append(contentsOf: listValue.dataFlatten())
            } else {
                result.append(currentNode!.value)
            }
            currentNode = currentNode!.nextItem
        }
        
        return result
    }
}
