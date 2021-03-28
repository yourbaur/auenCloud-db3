//
//  MainPageViewController.swift
//  AuenCloud
//
//  Created by Admin on 12/3/20.
//

import UIKit
import SnapKit

class MainPageViewController: ScrollViewController {
    var recordList = [Record(id:4, title: "Moldanazar - Ozin Gana", url:"/records/2020/08/03/5f28072f593c6.mp3")]
    lazy var getRecord: ((Int) -> Void) = { [weak self] position in
        guard let strongSelf = self else { return }
        strongSelf.present(MusicPlayerViewController(recordList: strongSelf.recordList, position: position), animated: true, completion: nil)
        
    }
    
    let listOfCats = ["Поиск","Новости","Новинки", "Рекомендации", "Жанры"]
    let listOfGenres = ["Джазз", "Блюз", "Поп", "Q-pop", "Инди"]
    var listOfNews:[News] = []
    var loginViewModel = LoginViewModel()
    // MARK: - Properties
    
    private let edge = 16
    lazy var newsLabel: UILabel = {
        let label = UILabel()
        label.text = "Новости"
        label.font = UIFont(name: Font.GTWalsheimBold, size: 30)
        label.textColor = #colorLiteral(red: 0.3176470588, green: 0.3607843137, blue: 0.4352941176, alpha: 1)
        return label
    }()
    lazy var newsCollectionView = NewsCollectionView()
    
    lazy var logoImage: UIImageView = {
        let li = UIImageView(image: #imageLiteral(resourceName: "Group 262"))
        return li
    }()

    private let searchController =
        UISearchController(searchResultsController: nil)
    
    lazy var searchBarView: SearcherView = {
        let search = SearcherView()
        return search
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        return tableView
    }()

    
    var categoryList = [Cats]()
    var tracksList = [[String]]()
    

    
    // MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initList()
        setupViews()
    }
    
    func initList() {
        loginViewModel.getProfileData()
        
        loginViewModel.profile.observe(on: self) { (profile) in
            if profile != nil {
                self.tracksList = (profile?.rows) as! [[String]]
            for i in 0..<self.listOfCats.count {
                var products:[Product] = []
                for j in self.tracksList {
                    products.append(Product(id: 1, cat_id: 2, name: j[2], description: j[3], show_count: 2, price: 790, in_favorite: true, in_basket: false))
                }
                self.categoryList.append(Cats(id: 1, parent_id: 2, color: "white", image: "", name: self.listOfCats[i], products: products))
                self.tableView.reloadData()
            }}
        }
        self.tableView.reloadData()
//        for i in 0..<self.listOfCats.count {
//            var products:[Product] = []
//            for j in 0...5{
//                products.append(Product(id: 1, cat_id: 2, name: "dsd", description: "sdsd", show_count: 2, price: 790, in_favorite: true, in_basket: false))
//            }
//            self.categoryList.append(Cats(id: 1, parent_id: 2, color: "white", image: "", name: self.listOfCats[i], products: products))
//            self.tableView.reloadData()
//        }
//
//
        for i in 0..<4 {
            listOfNews.append(News(id:2, image:"",link: ""))
        }
        newsCollectionView.setNews(newsList: listOfNews)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - SetupViews
    func setupViews() {
        view.backgroundColor = .backColor
       
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalTo(-50)
   
        }}

}

// MARK: - Delegation Pattern
extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        if section == 0 {
            return searchBarView
        }
        if section == 1 {
            return newsCollectionView
        }
        else if section == 4 {
            let view = CategoryCollectionView()
            
            view.label.text = categoryList[section].name
            view.setGenres(genres: self.listOfGenres)
            
            return view
        }
        else {
            let view = ProductCollectionView()
            view.setProducts(products: categoryList[section].products ?? [])
            view.label.text = categoryList[section].name
            
            view.showTrack = {
                self.getRecord(0)
                
            }
            
            view.completion = {
                self.showErrorMessage(messageType: .none, "Успешно добавлено в избранное")
            }
            //view.setPaginationInfo(category_id: categoryList[section].id)
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 70
        default:
            return 300
        }
        
    }
}
