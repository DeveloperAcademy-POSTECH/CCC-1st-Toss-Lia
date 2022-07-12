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
    lazy var button: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
        configuration.baseBackgroundColor = .systemGroupedBackground
        configuration.baseForegroundColor = .secondaryLabel
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .boldSystemFont(ofSize: 15)
            return outgoing
        }
        $0.configuration = configuration
        $0.titleLabel?.font = .boldSystemFont(ofSize: 5)
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 10
        return $0
    }(UIButton())

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        configureUI()
        setLayout()
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
            labelStackView.leadingAnchor.constraint(equalTo: bankImageView.trailingAnchor, constant: 15),
            button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button.widthAnchor.constraint(greaterThanOrEqualToConstant: 10)
        ])
    }

    func setUI(item: HomeItem) {
        bankImageView.image = UIImage(named: item.image)
        bankImageView.layer.masksToBounds = true
        bankImageView.layer.cornerRadius = 20
        descriptionLabel.text = item.description
        mainLabel.text = item.main
        descriptionLabel.font = .preferredFont(forTextStyle: .footnote)
        descriptionLabel.textColor = .secondaryLabel
        mainLabel.font = .boldSystemFont(ofSize: 18)
        button.setTitle(item.buttonName(), for: .normal)
        if item.buttonType == .empty {
            button.isHidden = true
        }
    }

}

struct CustomCellPreview: PreviewProvider {

    static var previews: some View {
        HomeListCell().toPreview() // .preferredColorScheme(.dark)
    }

}
