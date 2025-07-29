//
//  SearchResultViewController.swift
//  YoungcamShopping
//
//  Created by 전민돌 on 7/27/25.
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher

final class SearchResultViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var productInfoList: [ProductData] = []
    var total: Int = 0
    var start: Int = 1
    var searchBarText: String?
   
    let totalLabel = {
        let label = UILabel()
        
        label.font = .boldSystemFont(ofSize: 13)
        label.textColor = .green
        
        return label
    }()
    
    let accuracyButton = UIButton().configureSortButton(title: "  정확도  ")
    let dateOrderButton = UIButton().configureSortButton(title: "  날짜순  ")
    let highPriceButton = UIButton().configureSortButton(title: "  가격높은순  ")
    let lowPriceButton = UIButton().configureSortButton(title: "  가격낮은순  ")
    
    lazy var productCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth
        
        layout.itemSize = CGSize(width: cellWidth/2.5, height: cellWidth/1.5)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.identifier)
        
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .black
        
        return collectionView
    }()
    
//    lazy var recommandProductCollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        let deviceWidth = UIScreen.main.bounds.width
//        let cellWidth = deviceWidth
//        
//        layout.itemSize = CGSize(width: cellWidth/2.5, height: cellWidth/1.5)
//        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 8
//        layout.scrollDirection = .horizontal
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: SearchResultCollectionViewCell.identifier)
//        
//        collectionView.collectionViewLayout = layout
//        collectionView.backgroundColor = .black
//        
//        return collectionView
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        callRequest(query: searchBarText ?? "캠핑카", sort: "sim")
        
        configureHierarchy()
        configureLayout()
        configureView()
        
        accuracyButton.addTarget(self, action: #selector(accuracyButtonTapped), for: .touchUpInside)
        dateOrderButton.addTarget(self, action: #selector(dateOrderButtonTapped), for: .touchUpInside)
        highPriceButton.addTarget(self, action: #selector(highPriceButtonTapped), for: .touchUpInside)
        lowPriceButton.addTarget(self, action: #selector(lowPriceButtonTapped), for: .touchUpInside)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productInfoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCollectionViewCell.identifier, for: indexPath) as! SearchResultCollectionViewCell
        
//        let recommandCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandCollectionViewCell.identifier, for: indexPath) as! RecommandCollectionViewCell
        
        let row = productInfoList[indexPath.row]
        
        setURLImage(url: row.image, imageView: productCell.thumbnailImageView)
        productCell.mallNameLabel.text = row.mallName
        productCell.titleLabel.text = row.title
        productCell.lpriceLabel.text = Int(row.lprice)?.formatted()
        
//        setURLImage(url: row.image, imageView: recommandCell.thumbnailImageView)
        
        return productCell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (productInfoList.count - 3) && start < 1000 {
            start += 30
            callRequest(query: searchBarText!, sort: "sim")
        } else {
            
        }
    }
    
    func callRequest(query: String, sort: String) {
        let url = "https://openapi.naver.com/v1/search/shop.json?query=\(query)&display=30=10&start=\(start)&sort=\(sort)"
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id" : "4shhSTbwQvzuCGlJmy2J",
            "X-Naver-Client-Secret" : "Up4CyWzOMf"
        ]
        
        AF.request(url, method: .get, headers: headers).validate(statusCode: 200..<300).responseDecodable(of: ProductInfo.self) { response in
            switch response.result {
            case .success(let value):
                self.productInfoList.removeAll()
                self.start = 1
                self.productInfoList.append(contentsOf: value.items)
                self.navigationItem.title = query
                self.total = value.total
                self.totalLabel.text = "\(value.total.formatted()) 개의 검색 결과"
                self.productCollectionView.reloadData()
                                    
                if self.productInfoList.count == 0 {
                    self.showAlert(title: "네트워크 통신 실패", message: "네트워크 통신에 실패했습니다", ok: "확인") {
                        print("확인 버튼 클릭")
                    }
                } else {
                    if self.start == 1 {
                        self.productCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
                    }
                }
                
            case .failure(let error):
                print("fail", error)
            }
        }
    }
    
    @objc func accuracyButtonTapped() {
        callRequest(query: searchBarText ?? "캠핑카", sort: "sim")
        self.productCollectionView.reloadData()
    }
    
    @objc func dateOrderButtonTapped() {
        callRequest(query: searchBarText ?? "캠핑카", sort: "date")
        self.productCollectionView.reloadData()
    }
    
    @objc func highPriceButtonTapped() {
        callRequest(query: searchBarText ?? "캠핑카", sort: "dsc")
        self.productCollectionView.reloadData()
    }
    
    @objc func lowPriceButtonTapped() {
        callRequest(query: searchBarText ?? "캠핑카", sort: "asc")
        self.productCollectionView.reloadData()
    }
}

extension SearchResultViewController: ViewDesignProtocol {
    func configureHierarchy() {
        view.addSubview(totalLabel)
        view.addSubview(accuracyButton)
        view.addSubview(dateOrderButton)
        view.addSubview(highPriceButton)
        view.addSubview(lowPriceButton)
        view.addSubview(productCollectionView)
//        view.addSubview(recommandProductCollectionView)
    }
    
    func configureLayout() {
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
        }
        
        accuracyButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel).offset(24)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.height.equalTo(35)
        }
        
        dateOrderButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel).offset(24)
            make.leading.equalTo(accuracyButton.snp_trailingMargin).offset(16)
            make.height.equalTo(35)
        }
        
        highPriceButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel).offset(24)
            make.leading.equalTo(dateOrderButton.snp_trailingMargin).offset(16)
            make.height.equalTo(35)
        }
        
        lowPriceButton.snp.makeConstraints { make in
            make.top.equalTo(totalLabel).offset(24)
            make.leading.equalTo(highPriceButton.snp_trailingMargin).offset(16)
            make.height.equalTo(35)
        }
        
        productCollectionView.snp.makeConstraints { make in
            // make.edges.equalToSuperview()
            make.top.equalTo(accuracyButton.snp_bottomMargin).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(8)
        }
        
//        recommandProductCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(productCollectionView.snp_bottomMargin).offset(4)
//            make.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
//            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(16)
//            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(8)
//        }
    }
    
    func configureView() {
        view.backgroundColor = .black
    }
}
