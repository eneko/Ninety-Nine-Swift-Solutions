import NinetyNineSwiftProblems

extension List {
    class func lotto(numbers: Int, maximum: Int) -> List<Int> {
        var lottoList: List<Int>!
        var lastElement: List<Int>?

        for _ in 0..<numbers {
            let randomNumber = randomInt(under: maximum + 1)
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
