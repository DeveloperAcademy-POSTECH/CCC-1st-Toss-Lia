//
//  CustomTabBarController.swift
//  TossClone
//
//  Created by 리아 on 2022/07/02.
//

import UIKit

final class CustomTabBarController: UITabBarController {

    enum TabItems: CaseIterable {
        case home
        case benefit
        case remit
        case stock
        case whole

        func name() -> String {
            switch self {
            case .home:
                return "홈"
            case .benefit:
                return "혜택"
            case .remit:
                return "송금"
            case .stock:
                return "주식"
            case .whole:
                return "전체"
            }
        }

        func icon() -> String {
            switch self {
            case .home:
                return "house.fill"
            case .benefit:
                return "diamond.svg"
            case .remit:
                return "wonsign.circle.fill"
            case .stock:
                return "chart.line.uptrend.xyaxis"
            case .whole:
                return "line.3.horizontal"
            }
        }

        func viewController() -> UIViewController {
            switch self {
            case .home:
                return HomeViewController()
            case .benefit:
                return UIViewController()
            case .remit:
                return UIViewController()
            case .stock:
                return UIViewController()
            case .whole:
                return UIViewController()
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarUI()
        setTabBarVC()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTabBarFrame()
    }

}

extension CustomTabBarController {

    private func setTabBarUI() {
        tabBar.layer.applyRoundedBorder()
        tabBar.barTintColor = .systemBackground
        tabBar.tintColor = .label
    }

    private func setTabBarFrame() {
        var tabFrame = tabBar.frame
        tabFrame.origin.y += 1
        tabFrame.size.height += 5
        tabBar.frame = tabFrame
    }

    private func setTabBarVC() {
        let vcs = TabItems.allCases.map { createNavigationVC(item: $0) }
        self.viewControllers = vcs
    }

    private func createNavigationVC(item: TabItems) -> UINavigationController {
        let navigationVC = UINavigationController(rootViewController: item.viewController())
        navigationVC.tabBarItem.title = item.name()
        navigationVC.tabBarItem.image = UIImage(systemName: item.icon()) ?? UIImage(named: item.icon())

        return navigationVC
    }

}
