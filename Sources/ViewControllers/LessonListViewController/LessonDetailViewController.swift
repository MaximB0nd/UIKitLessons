//
//  LessonDetailViewController.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 05.09.2025.
//

import Foundation
import UIKit

class LessonDetailViewController: UIViewController {
    
    var lesson: Lesson!
    
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let statusLabel = UILabel()
    let complitionToggleButton = UIButton()
    
    weak var lessonListViewController: LessonListViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupViews()
        setupConstraints()
        updateViews()
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        title = lesson.title
    }
    
    private func setupViews() {
        setupTitleLabel()
        setupDescriptionLabel()
        setupStatusLabel()
        setupComplitionToggleButton()
        view.addSubviews(titleLabel, descriptionLabel, statusLabel, complitionToggleButton)
    }
    
    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 17)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupStatusLabel() {
        statusLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupComplitionToggleButton() {
        complitionToggleButton.setTitle(lesson.isCompleted ? "Удалить завершение" : "Завершить", for: .normal)
        complitionToggleButton.setTitleColor(lesson.isCompleted ? .systemRed : .systemBlue, for: .normal)
        complitionToggleButton.addTarget(self, action: #selector(onTapComplitionToggleButton), for: .touchUpInside)
        complitionToggleButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func onTapComplitionToggleButton() {
        toggleComplition()
    }
    
    private func setupConstraints() {
        let padding = CGFloat(20)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            statusLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: padding),
            statusLabel.centerXAnchor.constraint(equalTo: descriptionLabel.centerXAnchor),
            
            complitionToggleButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: padding),
            complitionToggleButton.centerXAnchor.constraint(equalTo: statusLabel.centerXAnchor),
        ])
    }
    
    func updateViews() {
        titleLabel.text = lesson.title
        descriptionLabel.text = lesson.description
        UIView.animate(.bouncy) {
            statusLabel.text = lesson.isCompleted ? "Статус: ✅ Пройдено" : "Статус: ⏳ В процессе"
            statusLabel.textColor = lesson.isCompleted ? .systemGreen : .systemRed
            complitionToggleButton.setTitle(lesson.isCompleted ? "Удалить завершение" : "Завершить", for: .normal)
            complitionToggleButton.setTitleColor(lesson.isCompleted ? .systemRed : .systemBlue, for: .normal)
        }
    }
}
