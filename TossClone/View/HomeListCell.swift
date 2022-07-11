//
//  HomeListCell.swift
//  TossClone
//
//  Created by 리아 on 2022/07/10.
//

import SwiftUI
import UIKit

class HomeListCell: UICollectionViewCell {

    lazy var bankImageView = UIImageView()
    lazy var descriptionLabel = UILabel()
    lazy var mainLabel = UILabel()
    lazy var labelStackView = UIStackView(arrangedSubviews: [descriptionLabel, mainLabel])
    lazy var button = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        configureUI()
        setLayout()
        setUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension HomeListCell {

    private func configureUI() {
        bankImageView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bankImageView)
        contentView.addSubview(labelStackView)
        contentView.addSubview(button)
    }

    private func setLayout() {
        labelStackView.axis = .vertical
        labelStackView.distribution = .equalSpacing
        labelStackView.spacing = 5
        NSLayoutConstraint.activate([
            bankImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            bankImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bankImageView.heightAnchor.constraint(equalToConstant: 40),
            bankImageView.widthAnchor.constraint(equalTo: bankImageView.heightAnchor),
            labelStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: bankImageView.trailingAnchor, constant: 15)
        ])
    }

    func setUI() {
        bankImageView.image = UIImage(named: ImageLiteral.bankIcon)
        bankImageView.layer.masksToBounds = true
        bankImageView.layer.cornerRadius = 20
        descriptionLabel.text = "고객을 위한 혁신"
        mainLabel.text = "오늘부터, 매일 이자 받으세요"
        descriptionLabel.font = .preferredFont(forTextStyle: .footnote)
        descriptionLabel.textColor = .secondaryLabel
        mainLabel.font = .boldSystemFont(ofSize: 18)
    }

}

struct CustomCellPreview: PreviewProvider {

    static var previews: some View {
        HomeListCell().toPreview().preferredColorScheme(.dark)
    }

}
