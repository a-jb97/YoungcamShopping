//
//  SearchResultCollectionViewCell.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/27/25.
//

import UIKit
import SnapKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    static let identifier = "SearchResultCollectionViewCell"
    
    let totalLabel = UILabel()
    let accuracyButton = UIButton()
    let dateOrderButton = UIButton()
    let highPriceButton = UIButton()
    let lowPriceButton = UIButton()
    let thumbnailImageView = UIImageView()
    let mallNameLabel = UILabel()
    let titleLabel = UILabel()
    let lpriceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SearchResultCollectionViewCell: ViewDesignProtocol {
    func configureHierarchy() {
        <#code#>
    }
    
    func configureLayout() {
        <#code#>
    }
    
    func configureView() {
        <#code#>
    }
    
    
}
