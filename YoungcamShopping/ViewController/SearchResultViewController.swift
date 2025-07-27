//
//  SearchResultViewController.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/27/25.
//

import UIKit

class SearchResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    lazy var productCollectionView = {
        let collectionView = UICollectionView()
        
        collectionView.backgroundColor = .black
        
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productInfoList.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

extension SearchResultViewController: ViewDesignProtocol {
    func configureHierarchy() {
        <#code#>
    }
    
    func configureLayout() {
        <#code#>
    }
    
    func configureView() {
        view.backgroundColor = .black
    }
}
