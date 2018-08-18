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

    public func forEach(_ each: (T) -> Void) {
        var current: List? = self
        while let value = current?.value {
            each(value)
            current = current?.nextItem
        }
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

extension List where T: Equatable {
    public func contains(_ value: T) -> Bool {
        var current: List? = self
        while let currentValue = current?.value {
            if currentValue == value {
                return true
            }
            current = current?.nextItem
        }
        return false
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
