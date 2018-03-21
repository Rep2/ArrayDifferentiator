public struct Change<T> {
    public let from: T
    public let to: T

    public init(from: T, to: T) {
        self.from = from
        self.to = to
    }
}
