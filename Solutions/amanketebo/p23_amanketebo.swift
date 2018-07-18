import NinetyNineSwiftProblems

extension List {
    func randomSelect(amount: Int) -> List {
        var list: List<T> = self
        var listLength = list.length
        var selectedList: List<T>!
        var lastElement: List<T>?

        for _ in 0..<amount {
            guard listLength >= 1 else { return selectedList }
            let randomNumber = randomInt(under: listLength)
            let (rest, removed) = list.remove(at: randomNumber)

            if let removed = removed {
                let element = List<T>(removed)

                if rest != nil {
                    list = rest!
                }

                if selectedList == nil {
                    selectedList = element
                } else {
                    lastElement?.nextItem = element
                }

                lastElement = element
                listLength -= 1
            }
        }

        return selectedList
    }
}
