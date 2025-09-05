//
//  DataManager.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 05.09.2025.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    let lessons: [Lesson] = [
        Lesson(
            title: "Введение в UIKit",
            description: "Изучили основы UIViewController и его жизненный цикл.",
            isCompleted: true
        ),
        Lesson(
            title: "Auto Layout",
            description: "Глубоко погрузились в верстку кодом, anchor'ы и констрейнты.",
            isCompleted: true
        ),
        Lesson(
            title: "Навигация",
            description: "Изучаем UINavigationController и передачу данных между экранами.",
            isCompleted: false
        ),
        Lesson(
            title: "Таблицы (UITableView)",
            description: "Самая мощная и важная тема. Учимся работать со списками данных.",
            isCompleted: false
        )
    ]
}
