import NinetyNineSwiftProblems

extension List {
    func flatten() -> List {
        func append(_ list: List,_ anotherList: List) {
            var current = list

            while let nextItem = current.nextItem {
                current = nextItem
            }

            current.nextItem = anotherList
        }

        var list: List!
        var current = self

        while let nextItem = current.nextItem {
            if let foundList = current.value as? List {
                if list == nil {
                    list = foundList.flatten()
                } else {
                    append(list, foundList.flatten())
                }
            } else {
                if list == nil {
                    list = List(current.value)
                } else {
                    append(list, List(current.value))
                }
            }

            current = nextItem
        }

        if let foundList = current.value as? List {
            if list == nil {
                list = foundList.flatten()
            } else {
                append(list, foundList.flatten())
            }
        } else {
            if list == nil {
                list = List(current.value)
            } else {
                append(list, List(current.value))
            }
        }

        return list
    }
}
