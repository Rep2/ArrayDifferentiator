import XCTest
import Nimble
@testable import Differentiator

class MovedIndexesTest: XCTestCase {
    func test_Empty() {
        let initial = [Int]()
        let final = [Int]()

        let changes = final.indexesForMovedValues(comparedTo: initial)

        expect(changes.count) == 0
    }

    func test_NotChanged() {
        let initial = [0, 1, 2, 8]
        let final = [0, 1, 2, 8]

        let changes = final.indexesForMovedValues(comparedTo: initial)

        expect(changes.count) == 0
    }

    func test_Simple() {
        let initial = [0, 1]
        let final = [1, 0]

        let changes = final.indexesForMovedValues(comparedTo: initial)

        expect(changes.count) == 2
        expect(changes[0].from) == 0
        expect(changes[0].to) == 1
        expect(changes[1].from) == 1
        expect(changes[1].to) == 0
    }

    func test_Simple2() {
        let initial = [0, 1, 2]
        let final = [2, 1, 0]

        let changes = final.indexesForMovedValues(comparedTo: initial)

        expect(changes.count) == 2
        expect(changes[0].from) == 0
        expect(changes[0].to) == 2
        expect(changes[1].from) == 2
        expect(changes[1].to) == 0
    }

    func test_Complex() {
        let initial = [0, 1, 2, 3, 4, 5, 6, 7]
        let final = [3, 5, 6, 7, 8, 1, 0, 9, 11, 2, 3, 4]

        let changes = final.indexesForMovedValues(comparedTo: initial)

        expect(changes.count) == 8
        expect(changes[0].from) == 0
        expect(changes[0].to) == 6
        expect(changes[1].from) == 1
        expect(changes[1].to) == 5
        expect(changes[2].from) == 2
        expect(changes[2].to) == 9
        expect(changes[3].from) == 3
        expect(changes[3].to) == 0
        expect(changes[4].from) == 4
        expect(changes[4].to) == 11
        expect(changes[5].from) == 5
        expect(changes[5].to) == 1
        expect(changes[6].from) == 6
        expect(changes[6].to) == 2
        expect(changes[7].from) == 7
        expect(changes[7].to) == 3
    }
}
