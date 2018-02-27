extension List where T: Equatable {
    static func ==(lhs: List, rhs: List) -> Bool {
        let length = lhs.length
        guard length == rhs.length else {
            return false
        }
        
        for index in 0..<length {
            if lhs[index]! != rhs[index]! {
                return false
            }
        }
        
        return true
    }
    
    /** P06 (*) Find out whether a linked list is a palindrome.
     - returns: Bool indicate whether a linked list is a palindrome.
     - author: Henrique Valcanaia (`henriqueindalencio@gmail.com`)
     - complexity: O(n)
     - difficulty: 1/3
     */
    func isPalindrome() -> Bool {
        return self == reverse()
    }
}
