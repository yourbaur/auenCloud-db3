//
//  SettingCell.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class SettingsCell: UITableViewCell {
    var backView : UIView = {
        var backView = UIView()
            backView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return backView
    }()
    var nameOfCell : UILabel = {
        var label = UILabel()
           
        label.textColor = .black
        
        return label
    }()
    var notificationsSwitch = CustomSwitch()
    
    var didFailToLogin = {() -> () in }
    var isOn = 1
    var languageLabel : UILabel = {
        var label = UILabel()
            label.text = "Русский"
         
            label.textColor = #colorLiteral(red: 0.5058823529, green: 0.5490196078, blue: 0.6, alpha: 1)
            label.isHidden = true
            
        return label
    }()
    var arrowImageView : UIImageView = {
        var imageView = UIImageView()
            imageView.image  = #imageLiteral(resourceName: "↳ Icon Color")
            imageView.isHidden = true
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        contentView.isUserInteractionEnabled = false
        setup()
      
    }
    
  
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func setupValues(row: Int){
        
        switch row {
        case 0:
            nameOfCell.text = "Уведомления"
            notificationsSwitch.isHidden = false
        case 1:
            nameOfCell.text = "Язык"
            languageLabel.isHidden = false
        default:
            nameOfCell.text = "Сменить аккаунт"
            nameOfCell.textColor = #colorLiteral(red: 0.9215686275, green: 0.3411764706, blue: 0.3411764706, alpha: 1)
        }
       
            
        
    }
    
    func setup(){
        addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.top.equalTo(4)
            make.bottom.equalTo(-4)
            make.left.right.equalTo(0)
            make.height.equalTo(40)
        }
        backView.addSubview(nameOfCell)
        nameOfCell.snp.makeConstraints { (make) in
            make.left.equalTo(13)
            make.top.equalTo(11)
        }
        notificationsSwitch.isHidden = true
        backView.addSubview(notificationsSwitch)
        notificationsSwitch.snp.makeConstraints { (make) in
            make.top.equalTo(12.5)
            make.right.equalTo(-13)
            make.width.equalTo(32)
            make.height.equalTo(17)
        }
       
        backView.addSubview(languageLabel)
        languageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.right.equalTo(-13)
        }
        backView.addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { (make) in
            make.width.equalTo(7)
            make.height.equalTo(12)
            make.top.equalTo(14)
            make.right.equalTo(-19)
        }
        
        
        
        
    }
}
