//
//  ProductCollectionViewCell.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 27.01.2026.
//

import UIKit

final class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
