//
//  LessonGridCell.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 06.09.2025.
//

import Foundation
import UIKit

class LessonGridCell: UICollectionViewCell {
    
    let containerView = UIView()
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let statusImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setupContainerView()
        setupIconImageView()
        setupTitleLabel()
        setupStatusImageView()
        contentView.addSubviews(containerView, iconImageView, titleLabel, statusImageView)
    }
    
    private func setupContainerView() {
        containerView.backgroundColor = .secondarySystemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.cornerCurve = .continuous
        containerView.clipsToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .white
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupStatusImageView() {
        statusImageView.image = UIImage(systemName: "lock.fill")
        statusImageView.tintColor = .white
        statusImageView.contentMode = .scaleAspectFit
        statusImageView.isHidden = true
        statusImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            iconImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -16),
            
            statusImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            statusImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            statusImageView.widthAnchor.constraint(equalToConstant: 16),
            statusImageView.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
    
    func configure(with lesson: Lesson) {
        titleLabel.text = lesson.title
        iconImageView.image = UIImage(systemName: lesson.iconName)
        iconImageView.tintColor = lesson.color
        statusImageView.isHidden = !lesson.isLocked
        
        if lesson.isLocked {
            containerView.alpha = 0.7
        } else {
            containerView.alpha = 1
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if statusImageView.isHidden {
                UIView.animate(withDuration: 0.3) {
                    self.transform = self.isSelected ? CGAffineTransform(rotationAngle: -0.2) : .identity
                }
            } else {
                return
            }
        }
    }
}
