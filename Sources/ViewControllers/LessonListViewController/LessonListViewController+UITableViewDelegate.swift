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
        
        let section = indexPath.section
        
        var lesson = lessons[0]
        
        if section == 0 {
            lesson = uncompletedLessons[indexPath.row]
        } else {
            lesson = completedLessons[indexPath.row]
        }
        
        let detailViewController = LessonDetailViewController()
        
        detailViewController.lesson = lesson
        detailViewController.lessonListViewController = self
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
