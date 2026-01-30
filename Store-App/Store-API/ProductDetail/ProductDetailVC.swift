//
//  ProductDetailVC.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 28.01.2026.
//

import UIKit

final class ProductDetailVC: UIViewController {
    private let viewModel: ProductDetailsVM

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = viewModel.title
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    init(viewModel: ProductDetailsVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
