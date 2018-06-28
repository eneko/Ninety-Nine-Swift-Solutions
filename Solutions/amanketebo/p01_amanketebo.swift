import NinetyNineSwiftProblems

extension List {
    var last: T? {
        var current = self

        while let nextItem = current.nextItem {
            current = nextItem
        }

        return current.value
    }
}
