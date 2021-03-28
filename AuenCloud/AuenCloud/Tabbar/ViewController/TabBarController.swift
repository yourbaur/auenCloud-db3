//
//  TabBarController.swift
//  AuenCloud
//
//  Created by Admin on 12/3/20.
//

import Foundation

import UIKit

class TabbarController: UITabBarController, UITabBarControllerDelegate {
    var lastSelectedItemIndex = 0
    
    
    lazy var tabbarBackView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
            view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            view.layer.cornerRadius = 20
            view.layer.borderColor = #colorLiteral(red: 0.216, green: 0.22, blue: 0.235, alpha: 1)
            view.layer.borderWidth = 1

        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        tabBar.tintColor = #colorLiteral(red: 0.478, green: 0.694, blue: 0.863, alpha: 1)
        
        let main = MainPageViewController()
        main.tabBarItem = UITabBarItem.init(title: nil, image: #imageLiteral(resourceName: "home"), tag: 1)
        main.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        let fav = FavoritesViewController()
        fav.tabBarItem = UITabBarItem.init(title: nil, image: #imageLiteral(resourceName: "Vector-6"), tag: 0)
        fav.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        let profile = AllTracksViewController()
        profile.tabBarItem = UITabBarItem.init(title: nil, image: #imageLiteral(resourceName: "list"), tag: 2)
        profile.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        
        let item4 = ProfileViewController()
        item4.tabBarItem = UITabBarItem.init(title: nil, image: #imageLiteral(resourceName: "user"), tag: 2)
        item4.tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)

        
        self.tabBar.tintColor = .mainColor
        tabBar.barTintColor = UIColor.clear
        view.backgroundColor = .white
        self.tabBar.unselectedItemTintColor = .black
        UITabBar.appearance().barTintColor = .white
        
        self.viewControllers = [main, fav, profile, item4]
        
        tabBar.shadowImage = UIImage()
        tabBar.insertSubview(tabbarBackView, at: 0)

        tabbarBackView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(tabBar)
        }

      
        
        self.delegate = self

        // Do any additional setup after loading the view.
    }

}
