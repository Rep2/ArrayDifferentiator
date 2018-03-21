import UIKit
import Differentiator

class ChangeTableViewController: UITableViewController {
    var data = [
        [0, 1, 2, 3, 4, 5, 6],
        [0, 3, 4, 6, 5],
        [1, 1, 4, 0, 3, 3, 4, 6, 5],
        [1, 0, 7, 3, 4, 6, 5],
        [0, 3, 4, 6, 5],
        [0, 4, 3, 6, 7, 5]
    ]

    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(title: "Random", style: .plain, target: self, action: #selector(ChangeTableViewController.randomBarButtonItemTapped))
        ]

        tableView.registerCell(type: NumberTableViewCell.self)
    }

    @objc
    func randomBarButtonItemTapped() {
        let newIndex = (index + 1) % data.count

        let changes = data[newIndex].difference(comparedTo: data[index])

        index = newIndex

        tableView.performBatchUpdates(arrayDifference: changes)
    }
}

extension ChangeTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.cell(for: indexPath) as NumberTableViewCell

        cell.present(text: "\(data[index][indexPath.row])")

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[index].count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
