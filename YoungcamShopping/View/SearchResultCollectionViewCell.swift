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
    
    let mallNameLabel = {
        let label = UILabel()
        
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 13)
        
        return label
    }()
    let titleLabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 2
        
        return label
    }()
    
    let lpriceLabel = {
        let label = UILabel()
        
        label.textColor = .white
        
        return label
    }()
    
    let likeButton = {
        let button = configureLikeButton()
        
        return button
    }()
    
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
        contentView.addSubview(likeButton)
        contentView.addSubview(mallNameLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(lpriceLabel)
    }
    
    func configureLayout() {
        thumbnailImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(4)
            make.leading.equalTo(contentView).offset(-16)
            make.trailing.equalTo(contentView).offset(-16)
            make.width.equalTo(160)
            make.height.equalTo(160)
        }
        
        likeButton.snp.makeConstraints { make in
            make.bottom.equalTo(thumbnailImageView).offset(-8)
            make.trailing.equalTo(thumbnailImageView).offset(-8)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        mallNameLabel.snp.makeConstraints { make in
            make.top.equalTo(thumbnailImageView.snp_bottomMargin).offset(20)
            make.leading.equalTo(contentView).offset(-16)
            make.trailing.equalTo(contentView).offset(-16)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(mallNameLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(contentView).offset(-16)
            make.trailing.equalTo(contentView).offset(-16)
            make.width.equalTo(180)
        }
        
        lpriceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(12)
            make.leading.equalTo(contentView).offset(-16)
            make.trailing.equalTo(contentView).offset(-16)
        }
    }
    
    func configureView() {
        thumbnailImageView.contentMode = .scaleAspectFill
    }
    
    
}
