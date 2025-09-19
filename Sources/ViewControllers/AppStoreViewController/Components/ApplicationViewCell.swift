//
//  ApplicationViewCell.swift
//  UIKitLessons
//
//  Created by Максим Бондарев on 19/9/25.
//

import UIKit

class ApplicationViewCell: UICollectionViewCell {
    
    // MARK: - override UICollectionViewCell funcs
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - private setup funcs
    
    private func setupViews() {
        setupContainer()
        <#code#>
    }
    
    private func setupContainer() {
        <#code#>
    }
    
    private func setupConstaints() {
        <#code#>
    }
}

