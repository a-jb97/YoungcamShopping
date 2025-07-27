//
//  ViewController.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/27/25.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {
    let productSearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.tintColor = .white
        searchBar.barStyle = .black
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        searchBar.backgroundColor = .black
        
        return searchBar
    }()
    
    let mainImageView = {
        let imageView = UIImageView()
        
        imageView.image = .main
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let mainLabel = {
        let label = UILabel()
        
        label.text = "쇼핑하구팡"
        label.font = .boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        label.textColor = .white
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "영캠러의 쇼핑쇼핑"
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func callRequest(query: String) {
        let url = "https://openapi.naver.com/v1/search/shop.json?query=\(query)&display=100=10&start=1&sort=sim"
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : "4shhSTbwQvzuCGlJmy2J",
            "X-Naver-Client-Secret" : "Up4CyWzOMf"
        ]
        
        AF.request(url, method: .get, headers: headers).validate(statusCode: 200..<300).responseDecodable(of: ProductInfo.self) { response in
            switch response.result {
            case .success(let value):
                productInfoList = value
                
            case .failure(let error):
                print("fail", error)
            }
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(#function, searchBar.text ?? "텍스트 없음")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        
        guard let text = searchBar.text, text.count >= 2 else {
            print("두 글자 이상 입력해주세요!")
            return
        }
        
        // MARK: 화면 전환 필요
        callRequest(query: text)
    }
}

extension ViewController: ViewDesignProtocol {
    func configureHierarchy() {
        view.addSubview(productSearchBar)
        view.addSubview(mainImageView)
        view.addSubview(mainLabel)
    }
    
    func configureLayout() {
        productSearchBar.snp.makeConstraints { make in
            make.horizontalEdges.centerX.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainImageView.snp.makeConstraints { make in
            make.horizontalEdges.centerX.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.centerY.equalTo(view.safeAreaLayoutGuide)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.horizontalEdges.centerX.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(mainImageView).offset(32)
        }
    }
    
    func configureView() {
        view.backgroundColor = .black
        productSearchBar.delegate = self
    }
}
