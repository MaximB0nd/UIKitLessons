//
//  AppStoreViewController.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 19/9/25.
//

import UIKit

class AppStoreViewController: UIViewController {
    
    internal var collectionView: UICollectionView!
    internal var dataSource: UICollectionViewDiffableDataSource<Section, ApplicationModel>!
    
    private let carouselItems: [ApplicationModel] = [
        ApplicationModel(id: UUID(), title: "New app!", imageName: "carousel_1"),
        ApplicationModel(id: UUID(), title: "Most popular", imageName: "carousel_2"),
        ApplicationModel(id: UUID(), title: "App of day", imageName: "carousel_3")
    ]
    
    private let gridItems: [ApplicationModel] = (1...9).map {
        ApplicationModel(id: UUID(), title: "Application \($0)", imageName: "grid_\($0)")
    }
    
    // MARK: - override UIViewController funcs
    
    override func viewDidLoad() {
        setupViews()
        setupConstaints()
        configureDataSource()
        applyInitialSnapshot()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - private setup funcs
    
    private func setupViews() {
        setupViewController()
        setupCollectionView()
        view.addSubviews(collectionView)
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.register(ApplicationViewCell.self, forCellWithReuseIdentifier: ApplicationViewCell.identifier)
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Appes"
    }
    
    private func setupConstaints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func applyInitialSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ApplicationModel>()
        
        snapshot.appendSections([.carousel, .grid])
        
        snapshot.appendItems(carouselItems, toSection: .carousel)
        snapshot.appendItems(gridItems, toSection: .grid)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}

