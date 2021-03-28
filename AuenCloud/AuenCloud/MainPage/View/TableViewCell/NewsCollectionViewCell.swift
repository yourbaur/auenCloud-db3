//
//  NewsCollectionViewCell.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit
import SDWebImage

class NewsCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        return view
    }()
    var news: News! {
        didSet {
            //imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
            imageView.image = #imageLiteral(resourceName: "moldanazar-anons")
        }
    }
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setNews(news: News){
        self.news = news
    }
    
    // MARK: - SetupViews
    func setupViews() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-5)
            make.left.equalTo(5)
            make.bottom.equalTo(-10)
        }
    }
    
}
