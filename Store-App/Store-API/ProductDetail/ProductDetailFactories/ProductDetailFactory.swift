//
//  ProductDetailFactory.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 28.01.2026.
//

import Foundation
import UIKit

final class ProductDetailFactory {
    func makeViewController(id: Int, title: String) -> UIViewController {
        let httpClient = URLSessionHTTPClient()
        let url = URL(string: APIConstants.baseURL + "products/\(id)")!
        
        let service = ProductDetailService(httpClient: httpClient, url: url)
        let viewModel = ProductDetailsVM(service: service, title: title)
        let viewController = ProductDetailVC(viewModel: viewModel)
        return viewController
    }
}
