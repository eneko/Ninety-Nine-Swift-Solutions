import Foundation

public func randomInt(under limit: Int) -> Int {
    if limit < 2 {
        return 0
    }
    #if os(Linux)
        assert(limit != 0)
        srandom(UInt32(time(nil)))
        return random() % limit
    #else
        return Int(arc4random_uniform(UInt32(limit)))
    #endif
}
