import NinetyNineSwiftProblems

extension List {
    func decode() -> List<String> {
        var current: List<T>? = self
        var decodedList: List<String>!
        var lastDecodedElement: List<String>!

        repeat {
            if let tuple = current?.value as? (Int, String) {
                let count = tuple.0
                let value = tuple.1

                for _ in 0..<count {
                    let element = List<String>(value)

                    if decodedList == nil {
                        decodedList = element
                    } else {
                        lastDecodedElement.nextItem = element
                    }

                    lastDecodedElement = element
                }
            }
            current = current!.nextItem
        } while current != nil

        return decodedList
    }
}
