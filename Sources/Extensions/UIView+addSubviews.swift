//
//  View+addSubviews.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 03.09.2025.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
