import NinetyNineSwiftProblems
import SolutionTester

extension List where T: Equatable {
    func pack() -> List<List<T>> {
        var current: List<T>? = self
        var start = self
        var listOfLists: List<List<T>>!
        var lastElementOfList: List<List<T>>?

        repeat {
            if let nextItem = current!.nextItem {
                if current!.value != nextItem.value {
                    current!.nextItem = nil

                    if listOfLists == nil {
                        listOfLists = List<List<T>>(start)
                        lastElementOfList = listOfLists
                    } else {
                        lastElementOfList?.nextItem = List<List<T>>(start)
                        lastElementOfList = lastElementOfList?.nextItem
                    }

                    start = nextItem
                }

                current = nextItem
            } else {
                if listOfLists == nil {
                    listOfLists = List<List<T>>(start)
                    lastElementOfList = listOfLists
                } else {
                    lastElementOfList?.nextItem = List<List<T>>(start)
                    lastElementOfList = lastElementOfList?.nextItem
                }

                current = nil
            }
        } while current != nil

        return listOfLists
    }
}
