import Foundation
import NinetyNineSwiftProblems

extension TimeInterval {
    var secs: String {
        return String(format: "%0.3f seconds", self)
    }
}

extension Optional {
    var unwrapped: String {
        switch self {
        case .none:
            return "nil"
        case let .some(wrapped):
            return String(describing: wrapped)
        }
    }
}

// MARK: - Conformance to CustomStringConvertible

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

// MARK: - Conformance to Sequence protocol

extension List: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var current: List<T>? = self
        return AnyIterator {
            defer { current = current?.nextItem }
            return current?.value
        }
    }
}

// MARK: - Conformance to Equatable protocol

extension List: Equatable where T: Equatable {
    public static func == (lhs: List<T>, rhs: List<T>) -> Bool {
        return lhs.map { $0 } == rhs.map { $0 }
    }
}


extension List {
    public func get<T>(at index: Int) -> T? {
        var count = 0
        var current = self
        while count < index {
            guard let next = current.nextItem else {
                return nil
            }
            count += 1
            current = next
        }
        return current.value as? T
    }

}
