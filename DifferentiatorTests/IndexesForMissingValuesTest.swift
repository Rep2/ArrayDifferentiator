import XCTest
import Nimble
@testable import Differentiator

class IndexesForMissingValuesTest: XCTestCase {
    func test_Empty() {
        let initalArray = [Int]()
        let finalArray = [Int]()

        let difference = initalArray.indexesForMissingValues(comparedTo: finalArray)

        expect(difference) == []
    }

    func test_Single_EmptyInitial() {
        let initalArray = [Int]()
        let finalArray = [0]

        let difference = initalArray.indexesForMissingValues(comparedTo: finalArray)

        expect(difference) == [0]
    }

    func test_Multiple_EmptyInitial() {
        let initalArray = [Int]()
        let finalArray = [0, 1, 2]

        let difference = initalArray.indexesForMissingValues(comparedTo: finalArray)

        expect(difference) == [0, 1, 2]
    }

    func test_Single() {
        let initalArray = [1]
        let finalArray = [0, 1]

        let difference = initalArray.indexesForMissingValues(comparedTo: finalArray)

        expect(difference) == [0]
    }

    func test_Multiple() {
        let initalArray = [0, 2]
        let finalArray = [0, 1, 2, 3, 4]

        let difference = initalArray.indexesForMissingValues(comparedTo: finalArray)

        expect(difference) == [1, 3, 4]
    }

    func test_Complex() {
        let initalArray = [0, 2, 5, 8, 10, 11, 12, 13, 17, 19]
        let finalArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 16, 19]

        let difference = initalArray.indexesForMissingValues(comparedTo: finalArray)

        expect(difference) == [1, 3, 4, 6, 7, 9, 11]
    }
}
