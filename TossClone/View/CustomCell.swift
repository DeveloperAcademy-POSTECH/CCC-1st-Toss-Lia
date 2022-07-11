//
//  CustomCell.swift
//  TossClone
//
//  Created by 리아 on 2022/07/10.
//

import UIKit

class CustomCell: UICollectionViewCell {

    lazy var tmpLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        configureLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureLabel() {
        tmpLabel.text = "text"
        tmpLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tmpLabel)
    }

}
