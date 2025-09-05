//
//  LessonListViewController.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 05.09.2025.
//

import UIKit

class LessonListViewController: UIViewController {
    
    let tableView = UITableView()
    let lessonsManager = DataManager.shared
    var lessons: [Lesson] {
        lessonsManager.lessons
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupViews()
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        title = "My lessons"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupViews() {
        setupTableView()
        view.addSubviews(tableView)
    }
    
    private func setupTableView() {
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LessonCell")
    }
}
