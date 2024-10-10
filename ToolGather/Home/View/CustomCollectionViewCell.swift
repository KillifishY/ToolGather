//
//  CustomCollectionViewCell.swift
//  ToolGather
//
//  Created by 于浏洋 on 2023/7/28.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    // Add any UI elements you want to display in the cell, for example:
    // let label: UILabel = ...
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        // Initialize and configure your cell's UI elements here, for example:
        // addSubview(label)
        // ...
    }
}
