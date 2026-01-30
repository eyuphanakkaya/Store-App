//
//  ProductDetailVC.swift
//  Store-App
//
//  Created by Eyüphan Akkaya on 28.01.2026.
//

import UIKit
import SnapKit

final class ProductDetailVC: UIViewController {
    // MARK: - Components
    private let viewModel: ProductDetailsVM
    private let productHeroView = ProductHeroView()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        viewModel.onSuccess = { [weak self] product in
            DispatchQueue.main.async {
                self?.productHeroView.configure(with: product)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    // MARK: - Initializer
    init(viewModel: ProductDetailsVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension ProductDetailVC {
    func setupView() {
        view.backgroundColor = .white
        title = viewModel.title
        
        setupConstraints()
    }
    
    func setupConstraints() {
        view.addSubview(productHeroView)
        productHeroView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
