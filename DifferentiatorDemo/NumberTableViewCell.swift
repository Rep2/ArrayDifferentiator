import UIKit
import SnapKit

class NumberTableViewCell: UITableViewCell {
    lazy var titleLabel: UILabel = {
        return UILabel()
    }()

    override func layoutSubviews() {
        super.layoutSubviews()

        setupCell()
    }

    func setupCell() {
        contentView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
            make.centerY.equalTo(self)
        }
    }

    func present(text: String) {
        titleLabel.text = text
    }
}
