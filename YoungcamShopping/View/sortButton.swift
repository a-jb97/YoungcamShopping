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
    
    
    return button
}
