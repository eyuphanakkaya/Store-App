//
//  ProductFactory.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 20.01.2026.
//

import Foundation
import UIKit

final class ProductFactory {
    func makeViewController() -> UIViewController {
        let client = URLSessionHTTPClient()
        let urlString = APIConstants.baseURL + "products"
        let url = URL(string: urlString)!
        
        let loader = ProductsService(client: client, url: url)
        
        let vc = ProductsVC(loader: loader)
        return vc
    }
}
