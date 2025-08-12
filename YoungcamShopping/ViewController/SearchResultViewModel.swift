//
//  SearchResultViewModel.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 8/12/25.
//

import Foundation

enum Sorted: String {
    case sim = "sim"
    case date = "date"
    case dsc = "dsc"
    case asc = "asc"
}

class SearchResultViewModel {
    var inputProductName: Observable<String> = Observable("")
}
