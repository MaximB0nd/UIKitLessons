//
//  LessonSectionHeaderView.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 06.09.2025.
//

import Foundation
import UIKit

final class LessonSectionHeaderView: UITableViewHeaderFooterView {
    
    let titleLable = UILabel()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupContentView()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupContentView() {
        contentView.backgroundColor = .clear
    }
    
    private func setupViews() {
        setupTitleLable()
        contentView.addSubviews(titleLable)
    }
    
    private func setupTitleLable() {
        titleLable.font = .systemFont(ofSize: 17, weight: .bold)
        titleLable.textColor = .blue
        titleLable.backgroundColor = .clear
        titleLable.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        let padding = CGFloat(16)
        
        NSLayoutConstraint.activate([
            titleLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            titleLable.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(with title: String) {
        titleLable.text = title
    }
}
