//
//  URLImage.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/27/25.
//

import UIKit
import Kingfisher

@MainActor func setURLImage(url: String, imageView: UIImageView) {
    let url = URL(string: url)
    imageView.kf.setImage(with: url)
}
