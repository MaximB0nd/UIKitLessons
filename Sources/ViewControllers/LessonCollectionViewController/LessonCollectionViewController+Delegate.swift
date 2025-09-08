//
//  LessonCollectionViewController+Delegate.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 08.09.2025.
//

import Foundation
import UIKit

extension LessonCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let lesson = lessons[indexPath.item]
        
        if lesson.isLocked {
            let alert = UIAlertController(title: "Закрыто 🔒", message: "Этот урок еще не доступен", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ок", style: .default))
            
            present(alert, animated: true)
        } else {
            print("opeing \(lesson)")
        }
    }
    
    
}
