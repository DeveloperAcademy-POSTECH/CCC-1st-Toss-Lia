//
//  HomeViewController.swift
//  TossClone
//
//  Created by 리아 on 2022/07/01.
//

import SwiftUI
import UIKit

final class HomeViewController: UIViewController {

    private let headerType = "section-header-element-kind"
    private let footerType = "section-footer-element-kind"

    private lazy var logoView: UIStackView = {
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

    private lazy var chatBarItem: UIBarButtonItem = {
        let chatImage = UIImage(systemName: "message.fill")
        let chatBarItem = UIBarButtonItem(image: chatImage, style: .plain,
                                          target: self, action: #selector(chatButtonPressed))
        chatBarItem.tintColor = .systemGray
        return chatBarItem
    }()

    private lazy var bellBarItem: UIBarButtonItem = {
        let bellImage = UIImage(systemName: "bell.fill")
        let bellBarItem = UIBarButtonItem(image: bellImage, style: .plain,
                                          target: self, action: #selector(bellButtonPressed))
        bellBarItem.tintColor = .systemGray
        return bellBarItem
    }()

    enum HomeSection: Int, CaseIterable {
        case bank
        case asset
        case consumtion
        case etc

        func name() -> String {
            switch self {
            case .bank:
                return "토스뱅크"
            case .asset:
                return "자산"
            case .consumtion:
                return "소비"
            case .etc:
                return ""
            }
        }
    }

    struct Item: Hashable {
        let id = UUID()
    }

    typealias DataSource = UICollectionViewDiffableDataSource<HomeSection, Item>
    typealias SnapShot = NSDiffableDataSourceSnapshot<HomeSection, Item>

    private var collectionView: UICollectionView!
    private var dataSource: DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        setNavigationItem()
        configureHierarchy()
        configureDataSource()
        applySnapShot()
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

// MARK: - Configure CollectionView

extension HomeViewController: UICollectionViewDelegate {

    private func configureHierarchy() {
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        view.addSubview(collectionView)
    }

    private func createHeaderFooterLayout() -> [NSCollectionLayoutBoundarySupplementaryItem] {
        let sectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: headerType, alignment: .topLeading)
        let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sectionHeaderSize, elementKind: footerType, alignment: .bottom)

        return [sectionHeader, sectionFooter]
    }

    private func createLayout() -> UICollectionViewLayout {
        typealias SectionProvider = (Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?

        let sectionProvider: SectionProvider = { [weak self] sectionIndex, _ in

            guard let sectionType = HomeSection(rawValue: sectionIndex) else { return nil }

            let section: NSCollectionLayoutSection
            let margin: CGFloat = 10

            switch sectionType {
            case .etc:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                      heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                       heightDimension: .fractionalHeight(0.5))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = margin
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
            default:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)

                if let headerFooter = self?.createHeaderFooterLayout() {
                    section.boundarySupplementaryItems = headerFooter
                }
            }
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }

    typealias SupplymentaryViewRegistration = UICollectionView.SupplementaryRegistration<SupplymentaryView>

    private func configureDataSource() {
        let cellRegisteration = UICollectionView.CellRegistration<CustomCell, Item> { cell, _, _ in
            cell.tmpLabel.text = "any"
        }

        dataSource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let section = HomeSection(rawValue: indexPath.section) else { return nil }
            switch section {
            case .bank:
                return collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: item)
            case .asset:
                return collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: item)
            case .consumtion:
                return collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: item)
            case .etc:
                return collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: item)
            }
        })

        let headerRegisteration = SupplymentaryViewRegistration(elementKind: headerType) { supplementaryView, _, index in
            guard let section = HomeSection(rawValue: index.section) else { return }
            supplementaryView.label.text = section.name()
            supplementaryView.view.layer.cornerRadius = 30
            supplementaryView.view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }

        let footerRegisteration = SupplymentaryViewRegistration(elementKind: footerType) { supplementaryView, _, _ in
            supplementaryView.label.isHidden = true
            supplementaryView.view.layer.cornerRadius = 30
            supplementaryView.view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }

        dataSource.supplementaryViewProvider = { collectionView, type, index in
            let headerFooterRegisteration = type == self.headerType ? headerRegisteration : footerRegisteration
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerFooterRegisteration, for: index)
        }

    }

    private func applySnapShot() {
        var snapshot = SnapShot()
        let sections = HomeSection.allCases
        snapshot.appendSections(sections)
        snapshot.appendItems([Item(), Item(), Item(), Item()], toSection: .bank)
        snapshot.appendItems([Item()], toSection: .asset)
        snapshot.appendItems([Item()], toSection: .consumtion)
        snapshot.appendItems([Item(), Item(), Item()], toSection: .etc)
        dataSource.apply(snapshot)
    }

}

struct HomeViewControllerPreview: PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}

class SupplymentaryView: UICollectionReusableView {

    lazy var label = UILabel()
    lazy var view = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setUI()
        layoutsubViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func addSubviews() {
        addSubview(view)
        addSubview(label)
    }

    private func layoutsubViews() {
        label.translatesAutoresizingMaskIntoConstraints = false
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 60),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            label.widthAnchor.constraint(greaterThanOrEqualToConstant: 10),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),

            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        ])
    }

    private func setUI() {
        view.backgroundColor = .systemBackground
        label.text = "title"
        label.font = .boldSystemFont(ofSize: 26)
    }

}
