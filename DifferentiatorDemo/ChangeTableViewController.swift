import UIKit
import Differentiator

class ChangeTableViewController: UITableViewController {
    var data = [0, 1, 2, 3, 4, 5, 6]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ChangeTableViewController.topRightBarButtonItemTapped))

        tableView.registerCell(type: NumberTableViewCell.self)
    }

    @objc
    func topRightBarButtonItemTapped() {
        let index = Int(arc4random()) % data.count
        let number = data.count

        let oldData = data
        data.insert(number, at: index)

        let changes = ArrayDifferentiator.callculateDifference(initialValues: oldData, finalValues: data)

        tableView.performBatchUpdates({
            tableView.insertRows(at: changes.added.map { IndexPath(row: $0, section: 0) }, with: .fade)
            tableView.deleteRows(at: changes.removed.map { IndexPath(row: $0, section: 0) }, with: .fade)

            changes.moved.forEach {
                tableView.moveRow(at: IndexPath(row: $0.from, section: 0), to: IndexPath(row: $0.to, section: 0))
            }
        })
    }
}

extension ChangeTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(for: indexPath) as NumberTableViewCell

        cell.present(text: "\(data[indexPath.row])")

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
