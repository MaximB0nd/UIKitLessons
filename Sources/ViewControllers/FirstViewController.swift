//
//  ViewController.swift
//  Today
//
//  Created by Максим Бондарев on 31.08.2025.
//

import UIKit

class FirstViewController: UIViewController {
    
    private var counter: Int = 0
    
    lazy var label = UILabel()
    lazy var button = UIButton()

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
    
    func setupViews() {
        setupLabel()
        setupButton()
        view.addSubviews(label, button)
    }
    
    func setupLabel() {
        label.text = "My first UIKit app"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupButton() {
        button.setTitle("Tap me", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
    }

    func setupLayout() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func style() {
        view.backgroundColor = .blue
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
    
    @objc
    private func buttonTapped() {
        counter += 1
        label.text = "Tapped \(counter) times"
        view.backgroundColor = counter % 2 == 0 ? .blue : .cyan
    }
}

