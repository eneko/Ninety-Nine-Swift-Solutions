import NinetyNineSwiftProblems

extension List {
    class func range(from: Int, to: Int) -> List<Int> {
        var list: List<Int>!
        var lastElement: List<Int>?

        for i in from...to {
            let element = List<Int>(i)

            if list == nil {
                list = element
            } else {
                lastElement?.nextItem = element
            }

            lastElement = element
        }

        return list
    }
}
