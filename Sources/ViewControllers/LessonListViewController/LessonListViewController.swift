//
//  LessonListViewController.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 05.09.2025.
//

import UIKit

class LessonListViewController: UIViewController {
    
    let tableView = UITableView()
    let containerView = UIView()
    
    let lessonsManager = DataManager.shared
    var lessons: [Lesson] {
        lessonsManager.lessons
    }
    
    var completedLessons: [Lesson] {
        DataManager.shared.lessons.filter { $0.isCompleted }
    }
    
    var uncompletedLessons: [Lesson] {
        DataManager.shared.lessons.filter { !$0.isCompleted }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupViews()
        setupConstraints()
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        title = "My lessons"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemCyan
        appearance.titleTextAttributes = [.foregroundColor: UIColor.red, .backgroundColor: UIColor.systemCyan]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.green, .backgroundColor: UIColor.systemCyan]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .blue
    }
    
    private func setupViews() {
        setupContainerView()
        setupTableView()
        view.addSubviews(containerView, tableView)
    }
    
    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(LessonTableViewCell.self, forCellReuseIdentifier: "LessonCell")
        tableView.register(LessonSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: "LessonSectionHeader")
        tableView.backgroundColor = .clear
        tableView.layer.cornerRadius = 20
        tableView.clipsToBounds = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupContainerView() {
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 20
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        containerView.layer.shadowRadius = 10
        containerView.clipsToBounds = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
}
