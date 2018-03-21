extension Array where Element: Equatable {
    public func difference(comparedTo initialValues: [Element]) -> ArrayDifference {
        return ArrayDifference(
            addedAt: initialValues.indexesForMissingValues(comparedTo: self),
            removedAt: self.indexesForMissingValues(comparedTo: initialValues),
            moved: self.indexesForMovedValues(comparedTo: initialValues)
        )
    }

    public func indexesForMissingValues(comparedTo initialValues: [Element]) -> [Int] {
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

    public func indexesForMovedValues(comparedTo initialValues: [Element]) -> [Change<Int>] {
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
}
