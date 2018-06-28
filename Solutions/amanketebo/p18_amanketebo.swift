import NinetyNineSwiftProblems

extension List {
    func slice(from: Int, to: Int) -> List? {
        var current: List<T>? = self
        var sliceList: List<T>!
        var lastSliceElement: List<T>?
        var index = 0

        while let value = current?.value {
            if index >= from && index < to {
                let element = List<T>(value)

                if sliceList == nil {
                    sliceList = element
                } else {
                    lastSliceElement?.nextItem = element
                }
                lastSliceElement = element
            }

            current = current?.nextItem
            index += 1
        }

        return sliceList
    }
}
