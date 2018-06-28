import NinetyNineSwiftProblems

extension List where T:Equatable {
    func isPalindrome() -> Bool {
        var reversed = self.reverse()
        var normal = self

        while let normalNextItem = normal.nextItem,
            let reversedNextItem = reversed.nextItem {
                if normal.value != reversed.value {
                    return false
                }

                normal = normalNextItem
                reversed = reversedNextItem
        }

        if normal.value != reversed.value {
            return false
        } else {
            return true
        }
    }
}

