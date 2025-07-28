//
//  Product.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/27/25.
//

import Foundation

struct ProductInfo: Decodable {
    let total: Int
    var items: [ProductData]
}

struct ProductData: Decodable {
    let title: String
    let image: String
    let lprice: String
    let mallName: String
}
