//
//  Lesson.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 05.09.2025.
//

import Foundation

struct Lesson {
    let id = UUID()
    let title: String
    let description: String
    var isCompleted: Bool
}
