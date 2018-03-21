public struct ArrayDifference {
    public let addedAt: [Int]
    public let removedAt: [Int]
    public let moved: [Change<Int>]

    public init(addedAt: [Int], removedAt: [Int], moved: [Change<Int>]) {
        self.addedAt = addedAt
        self.removedAt = removedAt
        self.moved = moved
    }
}
