//
//  SupplymentaryView.swift
//  TossClone
//
//  Created by 리아 on 2022/07/11.
//

import UIKit

class SupplymentaryView: UICollectionReusableView {

    lazy var label = UILabel()
    lazy var disclosureImageView: UIImageView = {
        let imageConfiguration = UIImage.SymbolConfiguration(weight: .bold)
        $0.image = UIImage(systemName: "chevron.right", withConfiguration: imageConfiguration)
        return $0
    }(UIImageView())

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
        addSubview(disclosureImageView)
    }

    private func layoutsubViews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        disclosureImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 60),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            label.widthAnchor.constraint(greaterThanOrEqualToConstant: 10),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            disclosureImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            disclosureImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }

    private func setUI() {
        backgroundColor = .clear
        label.text = "title"
        label.font = .boldSystemFont(ofSize: 26)
        disclosureImageView.tintColor = .systemGray
    }

}
