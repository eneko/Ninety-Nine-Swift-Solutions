import NinetyNineSwiftProblems

extension List {
    var penultimate: T? {
        var current = self

        while let _ = current.nextItem?.nextItem {
            current = current.nextItem!
        }

        if current.nextItem == nil {
            return nil
        } else {
            return current.value
        }
    }
}
