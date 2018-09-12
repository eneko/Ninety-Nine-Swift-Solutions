import Foundation

public class List<T> {
    public var value: T
    public var nextItem: List<T>?

    public convenience init(_ values: T...) {
        self.init(values)
    }

    public init(_ values: [T]) {
        value = values.first ?? die("Missing initial value")
        let remaining = Array(values.dropFirst())
        nextItem = remaining.isEmpty ? nil : List(remaining)
    }
}
