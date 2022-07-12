//
//  HomeEtcCell.swift
//  TossClone
//
//  Created by 리아 on 2022/07/12.
//

import SwiftUI
import UIKit

class HomeEtcCell: UICollectionViewCell {

    lazy var descriptionLabel = UILabel()
    lazy var mainLabel = UILabel()
    lazy var labelStackView = UIStackView(arrangedSubviews: [descriptionLabel, mainLabel])
    lazy var iconImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension HomeEtcCell {

    private func configureUI() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconImageView)
        contentView.addSubview(labelStackView)
    }

    private func setLayout() {
        labelStackView.axis = .vertical
        labelStackView.distribution = .equalSpacing
        labelStackView.spacing = 5
        NSLayoutConstraint.activate([
            labelStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            iconImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor)
        ])
    }

    func setUI(item: HomeItem) {
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.layer.cornerRadius = 20
        descriptionLabel.text = item.description
        mainLabel.text = item.main
        descriptionLabel.font = .preferredFont(forTextStyle: .body)
        descriptionLabel.textColor = .secondaryLabel
        mainLabel.font = .boldSystemFont(ofSize: 18)
        iconImageView.image = UIImage(named: item.image)
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 20
        if item.buttonType == .empty {
            button.isHidden = true
        }
    }

}

struct HomeEtcCellPreview: PreviewProvider {

    static var previews: some View {
        HomeEtcCell().toPreview().preferredColorScheme(.dark)
    }

}
