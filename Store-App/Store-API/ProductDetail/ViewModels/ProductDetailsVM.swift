//
//  ProductDetailsVM.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 28.01.2026.
//

import Foundation

final class ProductDetailsVM {
    var title: String
    private let service: ProductDetailService
    
    init(service: ProductDetailService, title: String) {
        self.service = service
        self.title = title
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
                print(error)
            }
        }
    }
}
