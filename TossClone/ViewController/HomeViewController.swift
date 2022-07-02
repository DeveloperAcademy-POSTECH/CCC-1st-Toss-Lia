//
//  HomeViewController.swift
//  TossClone
//
//  Created by 리아 on 2022/07/01.
//

import UIKit

final class HomeViewController: UIViewController {

    private let logoView: UIStackView = {
        let logoImage = UIImage(named: ImageLiteral.logo)
        let button = UIButton()
        button.setImage(logoImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        let spacer = UIView()
        let stack = UIStackView(arrangedSubviews: [button, spacer])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()

    private let chatBarItem: UIBarButtonItem = {
        let chatImage = UIImage(systemName: "message.fill")
        let chatBarItem = UIBarButtonItem(image: chatImage, style: .plain,
                                          target: HomeViewController.self, action: #selector(chatButtonPressed))
        chatBarItem.tintColor = .systemGray
        return chatBarItem
    }()

    private let bellBarItem: UIBarButtonItem = {
        let bellImage = UIImage(systemName: "bell.fill")
        let bellBarItem = UIBarButtonItem(image: bellImage, style: .plain,
                                          target: HomeViewController.self, action: #selector(bellButtonPressed))
        bellBarItem.tintColor = .systemGray
        return bellBarItem
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
        view.backgroundColor = .systemBackground
    }

}

extension HomeViewController {

    private func setNavigationItem() {
        navigationItem.titleView = logoView
        navigationItem.rightBarButtonItems = [bellBarItem, chatBarItem]
    }

    @objc func chatButtonPressed() {
    }

    @objc func bellButtonPressed() {
    }

}
