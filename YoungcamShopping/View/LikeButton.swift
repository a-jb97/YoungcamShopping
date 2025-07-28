//
//  LikeButton.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/28/25.
//

import UIKit

func configureLikeButton() -> UIButton {
    let button = UIButton()
    
    button.clipsToBounds = true
    button.setImage(UIImage(systemName: "heart"), for: .normal)
    button.tintColor = .black
    button.backgroundColor = .white
    button.layer.cornerRadius = 20
    
    return button
}
