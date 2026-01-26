//
//  ProductsVC.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 20.01.2026.
//

import Foundation
import UIKit

final class ProductsVC: UIViewController {
    private let loader: ProductLoader
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        load()
    }
    
    init(loader: ProductLoader) {
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func load() {
        loader.load { result in
            switch result {
            case .success(let response):
                response.forEach { item in
                    print(item)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    
}
