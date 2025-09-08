//
//  LessonCollectionViewController.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 06.09.2025.
//

import Foundation
import UIKit

class LessonCollectionViewController: UIViewController {
    
    let lessonManager = LessonDataManager.shared
    var lessons: [Lesson] {
        lessonManager.lessons
    }
    
    var isListMode: Bool = false {
        didSet {
            updateLayout()
            updateNavigationBar()
        }
    }
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupViews()
        setupConstraints()
    }
    
    private func updateLayout() {
        
        let newLayout = isListMode ? createListLayout() : createGridLayout()
        
        UIView.animate(withDuration: 0.3) {
            self.collectionView.setCollectionViewLayout(newLayout, animated: true)
        }
    }
    
    private func createGridLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        return layout
    }
    
    private func createListLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        return layout
    }
    
    @objc private func toggleLayoutMode() {
        isListMode.toggle()
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        title = "All lessons"
    }
    
    private func setupViews() {
        setupCollectionView()
        updateNavigationBar()
        view.addSubviews(collectionView)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        updateLayout()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        collectionView.register(LessonGridCell.self, forCellWithReuseIdentifier: "LessonGridCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func updateNavigationBar() {
        let changeModeButtonImage = isListMode ? UIImage(systemName: "square.and.arrow.down") : UIImage(systemName: "list.bullet")
        
        let switchLayoutButton = UIBarButtonItem(
            image: changeModeButtonImage,
            style: .plain,
            target: self,
            action: #selector(toggleLayoutMode))
        
        navigationItem.rightBarButtonItem = switchLayoutButton
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
