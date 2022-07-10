//
//  UIViewController+Preview.swift
//  TossClone
//
//  Created by 리아 on 2022/07/10.
//

import SwiftUI
import UIKit

extension UIViewController {

    private struct Preview: UIViewControllerRepresentable {

        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }

    }

    func toPreview() -> some View {
        Preview(viewController: self)
    }

}
