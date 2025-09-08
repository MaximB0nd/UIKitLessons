//
//  DataManager.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 05.09.2025.
//

import Foundation

class LessonDataManager {
    
    static let shared = LessonDataManager()
    
    private init() {}
    
    private var _lessons: [Lesson] = [
        Lesson(
            title: "Введение в UIKit",
            description: "Изучили основы UIViewController и его жизненный цикл.",
            isCompleted: true,
            isLocked: false,
            iconName: "swift",
            color: .systemOrange
        ),
        Lesson(
            title: "Auto Layout",
            description: "Глубоко погрузились в верстку кодом, anchor'ы и констрейнты.",
            isCompleted: true,
            isLocked: false,
            iconName: "arrow.left.and.right.square",
            color: .systemBlue
        ),
        Lesson(
            title: "Навигация",
            description: "Изучаем UINavigationController и передачу данных между экранами.",
            isCompleted: true,
            isLocked: false,
            iconName: "map",
            color: .systemGreen
        ),
        Lesson(
            title: "Таблицы (UITableView)",
            description: "Самая мощная и важная тема. Учимся работать со списками данных.",
            isCompleted: false,
            isLocked: false,
            iconName: "tablecells",
            color: .systemPurple
        ),
        Lesson(
            title: "Коллекции",
            description: "Это коллекции",
            isCompleted: false,
            isLocked: true,
            iconName: "tablecells",
            color: .systemRed
        ),
        Lesson(
            title: "Таблицы (UITableView)",
            description: "Самая мощная и важная тема. Учимся работать со списками данных.",
            isCompleted: false,
            isLocked: true,
            iconName: "tablecells",
            color: .systemRed
        ),
    ]
    
    
    
    var lessons: [Lesson] {
        _lessons
    }
    
    func update(id: UUID, isCompleted: Bool) {
        let lessonIndex = _lessons.firstIndex { $0.id == id }!
        _lessons[lessonIndex].isCompleted = isCompleted
    }
    
}
