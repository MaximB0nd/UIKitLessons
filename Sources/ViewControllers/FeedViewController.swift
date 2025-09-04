//
//  FeedViewController.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 04.09.2025.
//

import Foundation
import UIKit

class FeedViewController: UIViewController {
    
    let cardView = UIView()
    let avatarView = UIImageView()
    let nameLabel = UILabel()
    let usernameLabel = UILabel()
    let postTextLabel = UILabel()
    let likeButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setupStyle()
    }
    
    func setupViews() {
        setupCardView()
        setupAvatarView()
        setupNameLabel()
        setupUsernameLabel()
        setupPostTextLabel()
        setupLikeButton()
        view.addSubviews(cardView, avatarView, nameLabel, usernameLabel, postTextLabel, likeButton)
    }
    
    func setupCardView() {
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 12
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardView.layer.shadowRadius = 4
        cardView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupAvatarView() {
        avatarView.image = UIImage(systemName: "person.crop.circle.fill")
        avatarView.tintColor = .systemGray
        avatarView.contentMode = .scaleAspectFit
        avatarView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupNameLabel() {
        nameLabel.text = "Max Bond"
        nameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupUsernameLabel() {
        usernameLabel.text = "@maxbond"
        usernameLabel.font = .systemFont(ofSize: 14)
        usernameLabel.textColor = .secondaryLabel
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupPostTextLabel() {
        postTextLabel.text = "This is my first post on Instagram! I hope you like it. #swift #ios #programming #insta #fun #apple #iphone #mac #swiftui #xcode #macos #ipad #ui #ux #design #applewatch #watchos #development"
        postTextLabel.font = .systemFont(ofSize: 14)
        postTextLabel.numberOfLines = 0
        postTextLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLikeButton() {
        likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        likeButton.setTitle(" 0", for: .normal)
        likeButton.tintColor = .systemGray
        likeButton.addTarget(self, action: #selector(onTapLikeButton), for: .touchUpInside)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc
    private func onTapLikeButton(_ selder: UIButton) {
        let isLiked = selder.tintColor == .systemGray
        
        UIView.animate(withDuration: 0.2) {
            selder.tintColor = isLiked ? .systemRed : .systemGray
            selder.setImage(UIImage(systemName: isLiked ? "heart.fill" : "heart"), for: .normal)
        }
        
        if let title = selder.title(for: .normal), var count = Int(title.trimmingCharacters(in: .whitespaces)) {
            count = isLiked ? count + 1 : count - 1
            selder.setTitle(" \(count)", for: .normal)
        }
    }

    func setupConstraints() {
        
        let padding = CGFloat(16)
        
        NSLayoutConstraint.activate([
            
            cardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            avatarView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: padding),
            avatarView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding),
            avatarView.widthAnchor.constraint(equalToConstant: 50),
            avatarView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: cardView.trailingAnchor, constant: -padding),
            
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 2),
            usernameLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            
            postTextLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: padding),
            postTextLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: padding),
            postTextLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -padding),
            
            likeButton.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: padding),
            likeButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -padding),
            likeButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -padding),

        ])
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avatarView.layer.cornerRadius = avatarView.bounds.width / 2
        avatarView.clipsToBounds = true
    }
    
    func setupStyle() {
        view.backgroundColor = .systemGray6
    }
}
