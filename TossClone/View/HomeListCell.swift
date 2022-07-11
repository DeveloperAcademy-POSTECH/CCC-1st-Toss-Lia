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
    lazy var button = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        configureUI()
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
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bankImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(mainLabel)
        contentView.addSubview(button)
    }

    private func setLayout() {
    }

}

struct CustomCellPreview: PreviewProvider {

    static var previews: some View {
        HomeListCell().toPreview()
    }

}
