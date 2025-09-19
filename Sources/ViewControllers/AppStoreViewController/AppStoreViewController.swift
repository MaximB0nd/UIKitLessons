//
//  AppStoreViewController.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 19/9/25.
//

import UIKit

class AppStoreViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    internal var dataSource: UICollectionViewDiffableDataSource<Section, ApplicationModel>!
    
    private let carouselItems: [ApplicationModel] = [
        ApplicationModel(id: UUID(), title: "Главная новость", imageName: "carousel_1"),
        ApplicationModel(id: UUID(), title: "Срочное сообщение", imageName: "carousel_2"),
        ApplicationModel(id: UUID(), title: "Новость дня", imageName: "carousel_3")
    ]
    
    private let gridItems: [ApplicationModel] = (1...9).map {
        ApplicationModel(id: UUID(), title: "Новость \($0)", imageName: "grid_\($0)")
    }
    
    // MARK: - override UIViewController funcs
    
    override func viewDidLoad() {
        setupViews()
        setupConstaints()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - private setup funcs
    
    private func setupViews() {
        setupViewController()
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCollectionLayout())
        
        
    }
    
    
    
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupConstaints() {
        <#code#>
    }
    
    
}

