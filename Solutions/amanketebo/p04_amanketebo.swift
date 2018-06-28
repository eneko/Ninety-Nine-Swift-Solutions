import NinetyNineSwiftProblems

extension List {
    var length: Int {
        var current = self
        var count = 1

        while let nextItem = current.nextItem {
            current = nextItem
            count += 1
        }

        return count
    }
}
