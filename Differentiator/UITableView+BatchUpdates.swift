import UIKit

extension UITableView {
    public func performBatchUpdates(arrayDifference: ArrayDifference) {
        performBatchUpdates({
            insertRows(at: arrayDifference.added.map { IndexPath(row: $0, section: 0) }, with: .fade)
            deleteRows(at: arrayDifference.removed.map { IndexPath(row: $0, section: 0) }, with: .fade)

            arrayDifference.moved.forEach {
                moveRow(at: IndexPath(row: $0.from, section: 0), to: IndexPath(row: $0.to, section: 0))
            }
        })
    }
}
