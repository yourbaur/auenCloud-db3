//
//  ProfieViewController.swift
//  AuenCloud
//
//  Created by Admin on 12/3/20.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    //MARK: - Properties
    
//    lazy var leftBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "Search"), style: .plain, target: self, action: #selector(getSearch))
    lazy var tableView: UITableView = {
        let tableview = UITableView()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
      
        tableview.register(SettingsCell.self, forCellReuseIdentifier: "settingsCell")
        
        return tableview
    }()
    
    lazy var profileView = ProfileView()
    

  
    //MARK: - Initialization
    
    //MARK: - Lifycycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        setupView()
        
    }
    
   
    private func setupView() -> Void {
        addSubview(profileView)
        addSubview(tableView)
        profileView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.left.right.equalToSuperview()

        }
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(profileView.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(500)
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
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsCell

//            cell.configuration(data: latestNewList[indexPath.row])
            cell.setupValues(row: indexPath.row)
            
            return cell
       
    }
    
  
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            AppCenter.shared.makeRootController()
            
        }
    }
    
    
}

