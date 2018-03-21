import XCTest
import Nimble
@testable import Differentiator

class CalculateDifferencesTest: XCTestCase {
    func test_Simple() {
        let initial = [0, 1, 2, 3]
        let final = [3, 4, 1, 5]

        let arrayDifferences = ArrayDifferentiator.callculateDifference(initialValues: initial, finalValues: final)

        expect(arrayDifferences.added) == [1, 3]
        expect(arrayDifferences.removed) == [0, 2]

        expect(arrayDifferences.moved.count) == 2
        expect(arrayDifferences.moved[0].from) == 1
        expect(arrayDifferences.moved[0].to) == 2
        expect(arrayDifferences.moved[1].from) == 3
        expect(arrayDifferences.moved[1].to) == 0
    }

    func test_Simple2() {
        let initial = [0, 1, 2, 3, 4, 5, 6]
        let final = [0, 3, 4, 6, 5]

        let arrayDifferences = ArrayDifferentiator.callculateDifference(initialValues: initial, finalValues: final)

        expect(arrayDifferences.removed) == [1, 2]

        expect(arrayDifferences.moved.count) == 4
        expect(arrayDifferences.moved[0].from) == 3
        expect(arrayDifferences.moved[0].to) == 1
        expect(arrayDifferences.moved[1].from) == 4
        expect(arrayDifferences.moved[1].to) == 2
        expect(arrayDifferences.moved[2].from) == 5
        expect(arrayDifferences.moved[2].to) == 4
        expect(arrayDifferences.moved[3].from) == 6
        expect(arrayDifferences.moved[3].to) == 3
    }
}
