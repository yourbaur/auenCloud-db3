//
//  NewsCollectionView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class NewsCollectionView: UIView {
    
    private let cellId = "discountCell"
    var newsList = [News]()
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 200)
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        cv.backgroundColor = .backColor
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = #colorLiteral(red: 0.9333333333, green: 0.3333333333, blue: 0.3568627451, alpha: 1)
        pageControl.isUserInteractionEnabled = false
        pageControl.hidesForSinglePage = true
        pageControl.backgroundColor = .backColor
    
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(collectionView)
        addSubview(pageControl)
        
        collectionView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
        }
        pageControl.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView.snp.bottom)
            make.centerX.width.bottom.equalToSuperview()
        }
    }
    
    func setNews(newsList: [News]) {
        self.newsList = newsList
        pageControl.numberOfPages = newsList.count
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NewsCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsCollectionViewCell
        cell.setNews(news: newsList[indexPath.item])
        switch indexPath.row{
        case 0:
            cell.imageView.image = #imageLiteral(resourceName: "moldanazar-anons")
        case 1:
            cell.imageView.image = #imageLiteral(resourceName: "c74d97b01eae257e44aa-2")
        case 2:
            cell.imageView.image = #imageLiteral(resourceName: "Batyrkhan-Shukenov-Photo-1news.az_")
        default:
            cell.imageView.image = #imageLiteral(resourceName: "26c8f44c-c96a-41f2-ab6a-01dce1d2adc9")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let url = URL(string: newsList[indexPath.item].link) {
            UIApplication.shared.open(url)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        guard let indexPath = collectionView.indexPathsForVisibleItems.first else {return}
        pageControl.currentPage = indexPath.item
    }
}
