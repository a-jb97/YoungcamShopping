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
    
    let thumbnailImageView = {
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        
        return imageView
    }()
    
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
        contentView.addSubview(thumbnailImageView)
        contentView.addSubview(mallNameLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lpriceLabel)
    }
    
    func configureLayout() {
        thumbnailImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).inset(16)
            
        }
    }
    
    func configureView() {
        thumbnailImageView.contentMode = .scaleAspectFill
    }
    
    
}
