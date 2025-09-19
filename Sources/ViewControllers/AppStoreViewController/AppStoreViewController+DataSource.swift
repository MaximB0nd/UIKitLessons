//
//  AppStoreViewController+DataSource.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 19/9/25.
//

import UIKit

extension AppStoreViewController {
    internal func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<ApplicationViewCell, ApplicationModel> { cell, indexPath, newItem in
            
            cell.configure(with: newItem)
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, ApplicationModel>(collectionView: collectionView) {(collectionView,indexPath,item) -> UICollectionViewCell? in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
        
    }
}
