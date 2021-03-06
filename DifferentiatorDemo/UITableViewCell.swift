import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(type: T.Type) {
        register(T.self, forCellReuseIdentifier: String(describing: type.self))
    }

    func cell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        if let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T {
            return cell
        } else {
            fatalError("Unable to dequeue cell with identifier \(String(describing: T.self))")
        }
    }
}
