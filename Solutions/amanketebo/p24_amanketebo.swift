import NinetyNineSwiftProblems

extension List {
    class func lotto(numbers: Int, _ maximum: Int) -> List<Int> {
        var lottoList: List<Int>!
        var lastElement: List<Int>?

        for _ in 0..<numbers {
            let randomNumber = Int.random(in: 0...maximum)
            let element = List<Int>(randomNumber)

            if lottoList == nil {
                lottoList = element
            } else {
                lastElement?.nextItem = element
            }

            lastElement = element
        }

        return lottoList
    }
}
