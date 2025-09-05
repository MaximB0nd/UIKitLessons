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
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonCell", for: indexPath) as! LessonTableViewCell
        
        let lesson = lessons[indexPath.row]
        
        cell.configure(with: lesson)
        
        return cell
    }
}
