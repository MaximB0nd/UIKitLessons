//
//  ApplicationModel.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 19/9/25.
//

import Foundation

struct ApplicationModel: Hashable {
    let id: UUID
    let title: String
    let imageName: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: ApplicationModel, rhs: ApplicationModel) -> Bool {
        lhs.id == rhs.id
    }
}
