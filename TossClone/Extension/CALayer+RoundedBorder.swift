//
//  CALayer+RoundedBorder.swift
//  TossClone
//
//  Created by 리아 on 2022/07/03.
//

import UIKit

extension CALayer {

    func applyRoundedBorder() {
        borderWidth = 0.5
        borderColor = UIColor.tertiaryLabel.cgColor
        masksToBounds = true
        cornerRadius = 30
    }

}
