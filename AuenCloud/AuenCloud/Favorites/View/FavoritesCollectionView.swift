//
//  FavoritesCollectionView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit



class FavoritesCollectionView: UIView {
    // MARK: - Properties
    private let cellId = "productCell"
    
    lazy var collectionView : UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
       
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
        label.font = UIFont(name: Font.GTWalsheimBold, size: 24)
        label.textColor = #colorLiteral(red: 0.1176470588, green: 0.1568627451, blue: 0.262745098, alpha: 1)
        return label
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
        
        addSubview(collectionView)
        collectionView.backgroundColor = .backColor
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(label.snp.bottom)
            make.left.right.bottom.equalToSuperview()
           
        }
    }
    
    // MARK: - Actions
   
}

// MARK: - CollectionViewDelegates
extension FavoritesCollectionView: UICollectionViewDelegate, UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductCollectionViewCell
        cell.setProduct(product: products[indexPath.item])
        cell.busketButton.isHidden = true
        
        //cell.setContstraint(index: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 26, bottom: 5, right: 26)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 63) / 2, height: 250)
    }

}
