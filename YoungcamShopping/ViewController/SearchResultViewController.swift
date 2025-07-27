//
//  SearchResultViewController.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/27/25.
//

import UIKit
import SnapKit
import Kingfisher

class SearchResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let totalLabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .green
        
        return label
    }()
    
    let accuracyButton = configureSortButton(title: "  정확도  ")
    let dateOrderButton = configureSortButton(title: "  날짜순  ")
    let highPriceButton = configureSortButton(title: "  가격높은순  ")
    let lowPriceButton = configureSortButton(title: "  가격낮은순  ")
    
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
        
        totalLabel.text = "\(productInfoList.total) 개의 검색 결과"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productInfoList.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.identifier, for: indexPath) as! SearchResultCollectionViewCell
        let row = productInfoList.items[indexPath.row]
        
        setURLImage(url: row.image, imageView: cell.thumbnailImageView)
        cell.mallNameLabel.text = row.mallName
        cell.titleLabel.text = row.title
        cell.lpriceLabel.text = row.lprice
        
        return cell
    }
}

extension SearchResultViewController: ViewDesignProtocol {
    func configureHierarchy() {
        view.addSubview(totalLabel)
        view.addSubview(accuracyButton)
        view.addSubview(dateOrderButton)
        view.addSubview(highPriceButton)
        view.addSubview(lowPriceButton)
        view.addSubview(productCollectionView)
    }
    
    func configureLayout() {
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        accuracyButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(35)
        }
        
        dateOrderButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel).offset(24)
            make.leading.equalTo(accuracyButton.snp_trailingMargin).offset(16)
            make.height.equalTo(35)
        }
        
        highPriceButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel).offset(24)
            make.leading.equalTo(dateOrderButton.snp_trailingMargin).offset(16)
            make.height.equalTo(35)
        }
        
        lowPriceButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel).offset(24)
            make.leading.equalTo(highPriceButton.snp_trailingMargin).offset(16)
            make.height.equalTo(35)
        }
        
        productCollectionView.snp.makeConstraints { make in
            make.top.equalTo(accuracyButton.snp_bottomMargin).offset(8)
            make.centerX.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
    
    func configureView() {
        view.backgroundColor = .black
    }
}
