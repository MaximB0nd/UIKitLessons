//
//  LessonTableViewCell.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 05.09.2025.
//

import Foundation
import UIKit

class LessonTableViewCell: UITableViewCell {
    
    private let containerView = UIView()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let statusIndicatorView = UIView()
    
    private enum Constant {
        static let padding: CGFloat = 16
        static let iconSize: CGFloat = 24
        static let statusIndicatorSize: CGFloat = 12
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViewCell()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewCell() {
        containerView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setupViews() {
        setupContainerView()
        setupIconImageView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupStatusIndicatorView()
        contentView.addSubviews(containerView, iconImageView, titleLabel, descriptionLabel, statusIndicatorView)
    }
    
    private func setupContainerView() {
        containerView.backgroundColor = .secondarySystemGroupedBackground
        containerView.layer.cornerRadius = 12
        containerView.layer.cornerCurve = .continuous
        containerView.clipsToBounds = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupIconImageView() {
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .label
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        titleLabel.textColor = .label
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
        
    private func setupDescriptionLabel() {
        descriptionLabel.font = .systemFont(ofSize: 15)
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.numberOfLines = 2
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupStatusIndicatorView() {
        statusIndicatorView.layer.cornerRadius = Constant.statusIndicatorSize / 2
        statusIndicatorView.layer.cornerCurve = .continuous
        statusIndicatorView.translatesAutoresizingMaskIntoConstraints = false
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constant.padding),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Constant.padding),
            
            iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constant.padding),
            iconImageView.widthAnchor.constraint(equalToConstant: Constant.iconSize),
            iconImageView.heightAnchor.constraint(equalToConstant: Constant.iconSize),
            
            statusIndicatorView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            statusIndicatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constant.padding),
            statusIndicatorView.widthAnchor.constraint(equalToConstant: Constant.statusIndicatorSize),
            statusIndicatorView.heightAnchor.constraint(equalToConstant: Constant.statusIndicatorSize),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constant.padding),
            titleLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: Constant.padding),
            titleLabel.trailingAnchor.constraint(equalTo: statusIndicatorView.leadingAnchor, constant: -Constant.padding),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constant.padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constant.padding)
        ])
    }
    
    func configure(with lesson: Lesson) {
        titleLabel.text = lesson.title
        descriptionLabel.text = lesson.description
        
        if lesson.isCompleted {
            iconImageView.image = UIImage(systemName: "checkmark.circle.fill")
            iconImageView.tintColor = .systemGreen
            iconImageView.backgroundColor = .clear
        } else {
            iconImageView.image = UIImage(systemName: "circle")
            iconImageView.tintColor = .systemGray
            iconImageView.backgroundColor = .clear
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        UIView.animate(withDuration: 0.3) {
            self.containerView.transform = selected ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity
        }
    }
}










