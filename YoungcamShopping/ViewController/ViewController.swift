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
    let viewModel = MainViewModel()
    
    let productSearchBar = {
        let searchBar = UISearchBar()
        
        searchBar.tintColor = .white
        searchBar.barStyle = .black
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "브랜드, 상품, 프로필, 태그 등", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        searchBar.backgroundColor = .black
        
        return searchBar
    }() // Ob
    
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
        
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        navigationItem.title = "영캠러의 쇼핑쇼핑"
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        configureHierarchy()
        configureLayout()
        configureView()
        
        bindData()
    }
    
    private func bindData() {
        viewModel.inputSearchProduct.lazyBind {
            print(#function)
            
            guard let text = self.viewModel.inputSearchProduct.value, text.count >= 2 else {
                print("두 글자 이상 입력해주세요!")
                return
            }
            
            let vc = SearchResultViewController()
            
            vc.start = 1
            vc.searchBarText = text
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(#function, searchBar.text ?? "텍스트 없음")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.inputSearchProduct.value = productSearchBar.text
        bindData()
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
