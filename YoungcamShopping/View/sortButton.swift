//
//  sortButton.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/27/25.
//

import UIKit

func configureSortButton(title: String) -> UIButton {
    let button = UIButton()
    
    button.clipsToBounds = true
    button.setTitle(title, for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.cornerRadius = 10
    
    return button
}
