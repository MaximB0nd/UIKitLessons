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
        lessons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonCell", for: indexPath)
        
        let lesson = lessons[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        
        content.text = lesson.title
        content.secondaryText = lesson.isCompleted ? "✅ Пройдено" : "⏳ В процессе"
        
        cell.contentConfiguration = content
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
}
