//
//  ProductCollectionView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit



class ProductCollectionView: UIView {
    // MARK: - Properties
    private let cellId = "productCell"
    var completion: (() -> Void)?
    var showTrack:(() -> Void)?
    
    lazy var collectionView : UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: cellId)


        collectionView.allowsSelection = true
        collectionView.backgroundColor = .backColor
        return collectionView
    }()
    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.1176470588, green: 0.1568627451, blue: 0.262745098, alpha: 1)
        label.font = UIFont(name: "AvenirNext-Bold", size: 20)
        return label
    }()
    
    
    
    lazy var totalViewButton: UIButton = {
        let button = UIButton()
        let attribute: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.mainColor]
        let registrationButtonText = NSMutableAttributedString(string: "Смотреть все >", attributes: attribute)
        button.setAttributedTitle(registrationButtonText, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        return button
    }()
    var products = [Product]()
    var requestText = ""
    var category_id = 0
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .backColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProducts(products: [Product]) {
        self.products = products
    }
    func setPaginationInfo(category_id: Int) {
        self.category_id = category_id
    }
    
    func setupViews() {
    
        addSubview(label)
        addSubview(totalViewButton)
        addSubview(collectionView)
        collectionView.backgroundColor = .backColor
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        totalViewButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(label)
            make.right.equalToSuperview().offset(-16)
        }
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(250)
        }
    }
    
    // MARK: - Actions
   
}

// MARK: - CollectionViewDelegates
extension ProductCollectionView: UICollectionViewDelegate, UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductCollectionViewCell
        cell.setProduct(product: products[indexPath.item])
        cell.completionHandler = {
            self.completion!()
        }
        
        //cell.setContstraint(index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (frame.width)/2, height: collectionView.frame.height - 10)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
       
        showTrack!()
        

    }
    

}
