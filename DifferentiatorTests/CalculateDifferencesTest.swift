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
        expect(arrayDifferences.moved[0].from) == 0
        expect(arrayDifferences.moved[0].to) == 2
        expect(arrayDifferences.moved[1].from) == 2
        expect(arrayDifferences.moved[1].to) == 0
    }
}
