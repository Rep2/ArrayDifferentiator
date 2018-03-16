class ArrayDifferentiator {
//    func callculateChange<T: Equatable>(initial: [T], final: [T]) -> [ArrayDifference] {
//        var differences = [ArrayDifference]()
//
//        var notDeleted = [T]()
//
//        outer: for initialIndex in stride(from: initial.count - 1, through: 0, by: -1){
//            for finalIndex in stride(from: final.count - 1, through: 0, by: -1) {
//                if initial[initialIndex] == final[finalIndex] {
//                    notDeleted.append(initial[initialIndex])
//
//                    continue outer
//                }
//            }
//
//            differences.append(.deleted(index: initialIndex))
//        }
//    }

    func callculateDifference<T: Equatable>(initialValues: [T], finalValues: [T]) {
        let deletedIndexes = indexesForMissingValues(in: finalValues, comparedTo: initialValues)
    }

    func indexesForMissingValues<T: Equatable>(in finalValues: [T], comparedTo initialValues: [T]) -> [Int] {
        var finalValues = finalValues

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
}

enum ArrayDifference {
    case added
    case deleted(index: Int)
}
