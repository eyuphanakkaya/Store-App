//
//  ProductDetailsVM.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 28.01.2026.
//

import Foundation

final class ProductDetailsVM {
    private let service: ProductDetailService
    var title: String
    var onSuccess: ((ProductResponse) -> Void)?
    
    init(service: ProductDetailService, title: String) {
        self.service = service
        self.title = title
    }
    
    func viewWillAppear() {
        load()
    }
    
    private func load() {
        service.load { [weak self] result in
            guard let self else {return}

            switch result {
            case let .success(item):
                onSuccess?(item)
            case let .failure(error):
                print(error)
            }
        }
    }
}
