//
//  SupplymentaryView.swift
//  TossClone
//
//  Created by 리아 on 2022/07/11.
//

import UIKit

class SupplymentaryView: UICollectionReusableView {

    lazy var label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setUI()
        layoutsubViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension SupplymentaryView {

    private func addSubviews() {
        addSubview(label)
    }

    private func layoutsubViews() {
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 60),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            label.widthAnchor.constraint(greaterThanOrEqualToConstant: 10),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        ])
    }

    private func setUI() {
        backgroundColor = .clear
        label.text = "title"
        label.font = .boldSystemFont(ofSize: 26)
    }

}
