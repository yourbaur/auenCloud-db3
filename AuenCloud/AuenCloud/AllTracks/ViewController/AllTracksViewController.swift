//
//  AllTracksViewController.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation

import UIKit

class AllTracksViewController: UIViewController {
    var tracksList = [[String]]()
    var loginViewModel = LoginViewModel()
    //MARK: - Properties

//    lazy var leftBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Search"), style: .plain, target: self, action: #selector(getSearch))
    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        tableview.register(TracksHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerViewId")
        tableview.register(TrackViewCell.self, forCellReuseIdentifier: "translateCell")
        
        return tableview
    }()
    

  
    
    
    //MARK: - Initialization
    
    //MARK: - Lifycycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        loginViewModel.getProfileData()
        loginViewModel.profile.observe(on: self) { (profile) in
            if profile != nil {
                self.tracksList = (profile?.rows!) as! [[String]]
                self.tableView.reloadData()
           }
            
        }

        setupView()
    }
    
    private func setupView() -> Void {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(0)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = .mainColor
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        
//        navigationItem.leftBarButtonItem = leftBarButton
        //navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.478, green: 0.694, blue: 0.863, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false

    }
    //MARK: - Setup Functions
    
 
    //    MARK: - Parse functions
    


    //    MARK: - Objc functions
   
}
//MARK: - TableView Delegate
extension AllTracksViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tracksList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "translateCell", for: indexPath) as! TrackViewCell
        cell.AptekiView.clinicName.text = (tracksList[indexPath.row][3]) + " - " + (tracksList[indexPath.row][2]).suffix(10)
        cell.AptekiView.timeWork.isHidden = true
//            cell.configuration(data: latestNewList[indexPath.row])
           
//            cell.defLabel.text = "Moldanazar"
//            cell.titleLabel.text = "Ozin gana"
         
            
            return cell
       
    }
    
  
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerViewId") as! TracksHeaderView
        
        headerView.contentView.backgroundColor = .white
        headerView.backgroundColor = .clear
        headerView.actionEnabled(false)

        headerView.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)

        }
        
        let headerTile = "Все треки"
        
        headerView.titleLabel.text = headerTile
        return headerView
    }
    
    
}
