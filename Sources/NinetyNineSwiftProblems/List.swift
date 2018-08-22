public func die<T>(_ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) -> T {
    preconditionFailure("💥 " + message(), file: file, line: line)
}

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

/// Pretty print lists (literal array syntax)
extension List: CustomStringConvertible {
    public var description: String {
        var buffer: [String] = []
        var current: List? = self
        while let value = current?.value {
            buffer.append(String(describing: value))
            current = current?.nextItem
        }
        return "[" + buffer.joined(separator: ", ") + "]"
    }
}

//extension List: Sequence {
//    public func makeIterator() -> AnyIterator<T> {
//        var current: List<T>? = self
//        return AnyIterator {
//            defer { current = current?.nextItem }
//            return current?.value
//        }
//    }
//}
