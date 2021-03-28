//
//  ProductCollectionViewCell.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit
import SDWebImage


protocol ProductAddingDelegate: class {
    func addToBusket(product_id: Int)
    func addToFavorite(product_id: Int)
}

class ProductCollectionViewCell: UICollectionViewCell {
    var completionHandler: (() -> Void)?
    // MARK: - Properties
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor//UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize.zero
        view.layer.shadowRadius = 5
        view.layer.cornerRadius = 20
        return view
    }()
    public var delegate: ProductAddingDelegate?
    lazy var productImageView:UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "130713467-line-art-music-note-icon-black-doodle-musical-signs-signature-note-symbol-for-web-site-design-and-mo")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var discountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.GTWalsheimBold, size: 24)
        label.textColor = #colorLiteral(red: 0.1176470588, green: 0.1568627451, blue: 0.262745098, alpha: 1)
        label.layer.cornerRadius = 8
        label.text = "New"
        label.layer.masksToBounds = true
        label.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.7411764706, blue: 0, alpha: 1)
        return label
    }()
    
    lazy var nameProductLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-DemiBold", size: 14)
        label.textColor = .darkColor
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    lazy var measureProductLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Font.mullerRegular, size: 15)
        label.textColor = .lightColor
        label.numberOfLines = 2
        label.font = UIFont(name: "AvenirNext-Regular", size: 14)
        return label
    }()
    

    
    lazy var busketButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Group"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.addTarget(self, action: #selector(addToBusket), for: .touchUpInside)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "home"), for: .normal)
        //button.imageView?.contentMode  = .scaleAspectFit
        return button
    }()
    var product: Product! {
        didSet {
            nameProductLabel.text = product.name
            measureProductLabel.text = product.description
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
    var isInBusket = false
    var isInFavorite = false
    
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
        mainView.addSubview(measureProductLabel)
        
        mainView.addSubview(busketButton)
      

        
        productImageView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(120)
        }
       
      
        nameProductLabel.snp.makeConstraints { (make) in
            make.top.equalTo(productImageView.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
            
        }
        
        measureProductLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameProductLabel.snp.bottom).offset(8)
            make.right.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
        }
        
        busketButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.height.equalTo(50)
        }
        
      
        
        
    }
    
   
    
    @objc func addToBusket() {
        completionHandler!()
        if !product.in_basket {
            busketButton.setImage(#imageLiteral(resourceName: "Group"), for: .normal)
            delegate?.addToBusket(product_id: product.id)
        }
        
    }
}
