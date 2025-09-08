//
//  LessonCollectionViewController+Delegate.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 08.09.2025.
//

import Foundation
import UIKit

extension LessonCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard !isListMode else {
            return CGSize(width: collectionView.bounds.width, height: 110)
        }
        
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
    
        let sectionInset = layout.sectionInset
        let lineSpacing = layout.minimumLineSpacing
        let numberOfLines: CGFloat = isListMode ? 1 : 2
        
        let spacing = sectionInset.right + sectionInset.left + lineSpacing * (numberOfLines - 1)
        
        let availableWidth = collectionView.bounds.width - spacing
        
        let width = availableWidth / numberOfLines
        
        return CGSize(width: width, height: width*0.7)
    }
}
