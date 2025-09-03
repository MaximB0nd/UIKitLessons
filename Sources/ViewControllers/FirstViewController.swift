//
//  ViewController.swift
//  Today
//
//  Created by Максим Бондарев on 31.08.2025.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // main view is loading in memory (1) - custom drawing
    override func loadView() {
        super.loadView()
    }
    
    // main view loaded in memory (1) - adding subviews
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        style()
        setupLayout()
        
    }
    
    // view will appear (infinity) - updating all data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // view appeard (infinity) - animations
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // view will dissapear (infinity)
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // view dissapeared (infinity)/
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func setupViews() {
        view.addSubview(label)
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func style() {
        view.backgroundColor = .systemBackground
    }

}

