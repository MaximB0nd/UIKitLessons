//
//  LessonListViewController+UITableViewDelegate.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 05.09.2025.
//

import Foundation
import UIKit

extension LessonListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedLesson = lessons[indexPath.row]
        
        let detailViewController = LessonDetailViewController()
        
        detailViewController.lesson = selectedLesson
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}
