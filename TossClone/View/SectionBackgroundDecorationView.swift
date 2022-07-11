//
//  SectionBackgroundDecorationView.swift
//  TossClone
//
//  Created by 리아 on 2022/07/11.
//

import UIKit

class SectionBackgroundDecorationView: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}

extension SectionBackgroundDecorationView {

    func configure() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 30
    }

}

