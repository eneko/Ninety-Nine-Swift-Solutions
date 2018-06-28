import NinetyNineSwiftProblems

extension List {
    subscript(index: Int) -> T? {
        var current: List? = self

        for _ in 0..<index {
            current = current?.nextItem
        }

        return current?.value
    }
}
