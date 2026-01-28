//
//  ProductsVM.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 27.01.2026.
//

import Foundation


final class ProductsVM {
    private let service: ProductsService
    var products: [ProductResponse] = []
    
    var onSuccess: (() -> Void)?
    var onFailure: ((Error) -> Void)?
    
    init(service: ProductsService) {
        self.service = service
    }
    
    func viewWillAppear() {
        load()
    }
    
    private func load() {
        service.load { [weak self] result in
            switch result {
            case .success(let response):
                self?.products = response
                self?.onSuccess?()
            case .failure(let error):
                self?.onFailure?(error)
            }
        }
    }
}
