//
//  NetworkManager.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/29/25.
//

//import Foundation
//import Alamofire
//
//class NetworkManager {
//    static let shared = NetworkManager()
//    var start = 1
//    
//    private init() {  }
//    
//    func callRequest(query: String, sort: String, success: @escaping ([ProductData]) -> Void, fail: @escaping () -> Void ) {
//        let url = "https://openapi.naver.com/v1/search/shop.json?query=\(query)&display=30=10&start=\(start)&sort=\(sort)"
//        
//        let headers: HTTPHeaders = [
//            "X-Naver-Client-Id" : "4shhSTbwQvzuCGlJmy2J",
//            "X-Naver-Client-Secret" : "Up4CyWzOMf"
//        ]
//        
//        AF.request(url, method: .get, headers: headers).validate(statusCode: 200..<300).responseDecodable(of: ProductInfo.self) { response in
//            switch response.result {
//            case .success(let value):
//                self.productInfoList.removeAll()
//                self.productInfoList.append(contentsOf: value.items)
//                self.navigationItem.title = query
//                self.totalLabel.text = "\(value.total.formatted()) 개의 검색 결과"
//                self.productCollectionView.reloadData()
//                                    
//                if self.productInfoList.count == 0 {
//                    self.showAlert(title: "네트워크 통신 실패", message: "네트워크 통신에 실패했습니다", ok: "확인") {
//                        print("확인 버튼 클릭")
//                    }
//                } else {
//                    if self.start == 1 {
//                        self.productCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
//                    }
//                }
//                
//            case .failure(let error):
//                print("fail", error)
//            }
//        }
//    }
//}
