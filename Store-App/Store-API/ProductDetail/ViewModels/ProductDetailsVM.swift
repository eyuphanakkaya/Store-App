//
//  ProductDetailsVM.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 28.01.2026.
//

import Foundation

final class ProductDetailsVM {
    private let detailService: ProductDetailService
    private let productsService: ProductsService
    
    var title: String
    var productDetails: ProductResponse?
    var products: [ProductResponse]?
    
    var onSuccess: (() -> Void)?
    
    init(detailService: ProductDetailService, productsService: ProductsService, title: String) {
        self.detailService = detailService
        self.productsService = productsService
        self.title = title
    }
    
    func viewWillAppear() {
        detailLoad()
        productsLoad()
    }
    
    private func detailLoad() {
        detailService.load { [weak self] result in
            guard let self else {return}

            switch result {
            case let .success(item):
                onSuccess?()
                productDetails = item
            case let .failure(error):
                print(error)
            }
        }
    }
    
    private func productsLoad() {
        productsService.load { [weak self] result in
            guard let self else {return}
            
            switch result {
            case let .success(items):
                onSuccess?()
                products = items
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
