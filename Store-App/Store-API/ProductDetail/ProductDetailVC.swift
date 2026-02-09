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
    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout())
    
    private let viewModel: ProductDetailsVM

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        setupCollectionView()
        
        viewModel.onSuccess = { [weak self] product in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
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
    
    // MARK: - Helper
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(ProductHeroCell.self, forCellWithReuseIdentifier: ProductHeroCell.reuseIdentifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
    }
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)),
            subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}

extension ProductDetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductHeroCell.reuseIdentifier, for: indexPath) as! ProductHeroCell
        if let product = viewModel.product {
            cell.configure(with: product)
        }
        return cell
    }
}

private extension ProductDetailVC {
    func setupView() {
        view.backgroundColor = .white
        title = viewModel.title
    }
}
