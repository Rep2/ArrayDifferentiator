import UIKit

extension UITableView {
    public func performBatchUpdates(arrayDifference: ArrayDifference) {
        performBatchUpdates({
            insertRows(at: arrayDifference.addedAt.map { IndexPath(row: $0, section: 0) }, with: .bottom)
            deleteRows(at: arrayDifference.removedAt.map { IndexPath(row: $0, section: 0) }, with: .bottom)

            arrayDifference.moved.forEach {
                moveRow(at: IndexPath(row: $0.from, section: 0), to: IndexPath(row: $0.to, section: 0))
            }
        })
    }
}
