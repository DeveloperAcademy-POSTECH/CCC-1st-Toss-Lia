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

    enum HomeSection: Int, CaseIterable {
        case bank
        case asset
        case consumtion
        case etc
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
        view.backgroundColor = .systemBackground
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
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.delegate = self
        view.addSubview(collectionView)
    }

    private func createLayout() -> UICollectionViewLayout {
        typealias SectionProvider = (Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection?

        let sectionProvider: SectionProvider = { sectionIndex, layoutEnvironment in

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
                section = NSCollectionLayoutSection.list(using: .init(appearance: .plain),
                                                         layoutEnvironment: layoutEnvironment)
            }
            section.contentInsets = NSDirectionalEdgeInsets(top: margin, leading: margin,
                                                            bottom: margin, trailing: margin)
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }

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

class CustomCell: UICollectionViewCell {

    var tmpLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        configureLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func configureLabel() {
        tmpLabel.text = "text"
        tmpLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tmpLabel)
    }

}
