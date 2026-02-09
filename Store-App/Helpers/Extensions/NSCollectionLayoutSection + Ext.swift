//
//  NSCollectionLayoutSection + Ext.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 9.02.2026.
//

import UIKit

extension NSCollectionLayoutSection {
    static func fillWidth(heightDimension: NSCollectionLayoutDimension) -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: heightDimension)
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    static func custom(widthDimension: NSCollectionLayoutDimension, heightDimension: NSCollectionLayoutDimension) -> NSCollectionLayoutSection {
        let size = NSCollectionLayoutSize(widthDimension: widthDimension, heightDimension: heightDimension)
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
        return NSCollectionLayoutSection(group: group)
    }
    
    static func custom(widthDimension: NSCollectionLayoutDimension, heightDimension: NSCollectionLayoutDimension, subtItems: [NSCollectionLayoutItem]) -> (NSCollectionLayoutSize,NSCollectionLayoutSection) {
        let size = NSCollectionLayoutSize(widthDimension: widthDimension, heightDimension: heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: subtItems)
        return  (size,NSCollectionLayoutSection(group: group))
    }
}
