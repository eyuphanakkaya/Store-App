//
//  ProductsVM.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 27.01.2026.
//

import Foundation

@MainActor
final class ProductsVM {
    private let service: ProductsService
    private let storage: StoreStorage
    var products: [ProductResponse] = []
    
    var onSuccess: (() -> Void)?
    var onFailure: ((Error) -> Void)?
    
    init(service: ProductsService, storage: StoreStorage) {
        self.service = service
        self.storage = storage
    }
    
    func viewDidLoad() {
        load()
    }
}

extension ProductsVM {
    private func load() {
        Task {
            do {
                let result = try await service.load()
                products = result
                onSuccess?()
            } catch {
                onFailure?(error)
            }
        }
    }
    
    func toggleAddToCart(productID: Int) {
        guard let index = products.firstIndex(where: { $0.id == productID }) else { return }
        products[index].isAdded.toggle()
    }
}
