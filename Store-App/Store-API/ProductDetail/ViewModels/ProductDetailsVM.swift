//
//  ProductDetailsVM.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 28.01.2026.
//

import Foundation

final class ProductDetailsVM {
    private let service: ProductDetailService
    
    init(service: ProductDetailService) {
        self.service = service
    }
    
    func viewWillAppear() {
        load()
    }
    
    private func load() {
        service.load { result in
            switch result {
            case let .success(item):
                print(item)
            case let .failure(error):
            }
        }
    }
}
