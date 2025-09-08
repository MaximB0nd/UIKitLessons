//
//  LessonListViewController+UITableViewDataSource.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 05.09.2025.
//

import Foundation
import UIKit

extension LessonListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return uncompletedLessons.count
        } else {
            return completedLessons.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonCell", for: indexPath) as! LessonTableViewCell
        
        let section = indexPath.section
        
        var lesson = lessons[0]
        
        if section == 0 {
            lesson = uncompletedLessons[indexPath.row]
        } else {
            lesson = completedLessons[indexPath.row]
        }
        
        cell.configure(with: lesson)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            "Не завершенные"
//        } else {
//            "Завершенные"
//        }
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "LessonSectionHeader") as? LessonSectionHeaderView? else {
            return nil
        }
        
        if section == 0 {
            header?.configure(with: "Не завершенные")
        } else {
            header?.configure(with: "Завершенные")
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
