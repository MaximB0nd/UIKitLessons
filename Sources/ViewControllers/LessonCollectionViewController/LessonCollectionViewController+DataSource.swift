//
//  LessonCollectionViewController+DataSource.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 08.09.2025.
//

import Foundation
import UIKit

extension LessonCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        lessons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LessonGridCell", for: indexPath) as! LessonGridCell
        
        let item = lessons[indexPath.row]
        
        cell.configure(with: item)
        
        return cell
    }
    
}
