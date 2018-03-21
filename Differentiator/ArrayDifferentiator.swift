public class ArrayDifferentiator {
    public static func callculateDifference<T: Equatable>(initialValues: [T], finalValues: [T]) -> ArrayDifference {
        let removedIndexes = finalValues.indexesForMissingValues(comparedTo: initialValues)
        let addedIndexes = initialValues.indexesForMissingValues(comparedTo: finalValues)

        let movedIndexes = finalValues.indexesForMovedValues(comparedTo: initialValues)

        return ArrayDifference(added: addedIndexes, removed: removedIndexes, moved: movedIndexes)
    }
}

public struct Change<T> {
    public let from: T
    public let to: T

    public init(from: T, to: T) {
        self.from = from
        self.to = to
    }
}

extension Change where T: Equatable {
    static func == (lhs: Change<T>, rhs: Change<T>) -> Bool {
        return lhs.from == rhs.from &&
            lhs.to == rhs.to
    }
}

public struct ArrayDifference {
    public let added: [Int]
    public let removed: [Int]
    public let moved: [Change<Int>]

    public init(added: [Int], removed: [Int], moved: [Change<Int>]) {
        self.added = added
        self.removed = removed
        self.moved = moved
    }

}

extension Array where Element: Equatable {
    func indexesForMissingValues(comparedTo initialValues: [Element]) -> [Int] {
        var finalValues = self

        return initialValues
            .enumerated()
            .filter { _, value in
                guard let index = finalValues.enumerated().first(where: { $0.element == value })?.offset else {
                    return true
                }

                finalValues.remove(at: index)

                return false
            }
            .map { $0.offset }
    }

    func indexesForMovedValues(comparedTo initialValues: [Element]) -> [Change<Int>] {
        var foundValues = self.map { ($0, false) }

        var changes = [Change<Int>]()

        for i in 0..<initialValues.count {
            for j in 0..<foundValues.count {
                if initialValues[i] == foundValues[j].0 && !foundValues[j].1 {
                    if i != j {
                        changes.append(Change(from: i, to: j))
                    }

                    foundValues[j] = (foundValues[j].0, true)

                    break
                }
            }
        }

        return changes
    }

    func removed(at indexes: [Int]) -> [Element] {
        var array = self

        indexes
            .sorted { $0 > $1 }
            .forEach { array.remove(at: $0) }

        return array
    }
}
