//
//  CategoryCollectionViewCell.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit
import SDWebImage



class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        return view
    }()

    lazy var productImageView:UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "jazz")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    lazy var nameProductLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.mullerBold, size: 16)
        label.textColor = .darkColor
        label.lineBreakMode = .byCharWrapping
        label.text = "Джаз"
        return label
    }()
    
 
   

    var product: Product! {
        didSet {
            nameProductLabel.text = product.name
       
//            if product.in_favorite {
//                favoriteButton.setImage(UIImage(named: MediaType.fullheart), for: .normal)
//            } else {
//                favoriteButton.setImage(UIImage(named: MediaType.emptyHeart), for: .normal)
//            }
//            if product.in_basket {
//                busketButton.setImage(#imageLiteral(resourceName: "Frame 122"), for: .normal)
//            } else {
//                busketButton.setImage(#imageLiteral(resourceName: "Frame 122"), for: .normal)
//            }
//
        }
    }

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setProduct(product: Product) {
        self.product = product
    }
    
    func setContstraint(index: Int) {
        if index % 2 == 1 {
            mainView.snp.remakeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.left.equalTo(2)
                make.right.equalTo(-2)
            }
        }
        else {
            mainView.snp.remakeConstraints { (make) in
                make.top.bottom.equalToSuperview()
                make.left.equalTo(2)
                make.right.equalTo(-2)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupViews
    func setupViews() {
        addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(2)
            make.right.equalTo(-2)
        }
        mainView.addSubview(productImageView)
        mainView.addSubview(nameProductLabel)
      
       
    
        
        productImageView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(120)
        }
        
      
      
        nameProductLabel.snp.makeConstraints { (make) in
            make.top.equalTo(productImageView.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            
        }
    
        
    }
    
   
}
