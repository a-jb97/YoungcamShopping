//
//  RecommandCollectionViewCell.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/29/25.
//

import UIKit

class RecommandCollectionViewCell: UICollectionViewCell {
    static let identifier = "RecommandCollectionViewCell"
    
    let thumbnailImageView = {
        let imageView = UIImageView()
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
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

extension RecommandCollectionViewCell: ViewDesignProtocol {
    func configureHierarchy() {
        contentView.addSubview(thumbnailImageView)
    }
    
    func configureLayout() {
        thumbnailImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(4)
            make.leading.equalTo(contentView).offset(-16)
            make.trailing.equalTo(contentView).offset(-16)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }
    
    func configureView() {
        thumbnailImageView.contentMode = .scaleAspectFill
    }
}
