import NinetyNineSwiftProblems

extension List {
    func rotate(amount: Int) -> List {
        var start: List<T>? = self
        var startHasBeenSet = false
        let listLength = self.length
        let rotationPoint = (listLength + amount) % listLength
        var current: List<T>? = self
        var position = 1

        while let _ = current?.value {
            let nextItem = current?.nextItem

            if nextItem == nil && startHasBeenSet {
                current?.nextItem = self
            }

            if rotationPoint == position {
                start = current!.nextItem
                startHasBeenSet = true
                current?.nextItem = nil
            }

            current = nextItem
            position += 1
        }

        return start!
    }
}
