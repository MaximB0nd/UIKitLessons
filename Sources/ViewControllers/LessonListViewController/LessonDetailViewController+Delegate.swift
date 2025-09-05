//
//  LessonDetailDelegate.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 05.09.2025.
//

import Foundation

extension LessonDetailViewController {
    func toggleComplition() {
        lesson.isCompleted = !lesson.isCompleted
        lessonListViewController.lessonsManager.update(id: lesson.id, isCompleted: lesson.isCompleted)
        lessonListViewController.tableView.reloadData()
        updateViews()
        navigationController?.popViewController(animated: true)
    }
}
