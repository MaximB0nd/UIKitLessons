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
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupViews()
        setupConstraints()
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        title = "All lessons"
    }
    
    private func setupViews() {
        setupCollectionView()
        view.addSubviews(collectionView)
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 20, left: 20, bottom: 20, right: 20)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        collectionView.register(LessonGridCell.self, forCellWithReuseIdentifier: "LessonGridCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
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
