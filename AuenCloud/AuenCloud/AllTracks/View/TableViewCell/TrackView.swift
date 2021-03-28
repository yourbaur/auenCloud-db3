//
//  TrackView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class TrackView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackground()
        setupConstrain()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstrain() -> Void {
        addSubview(clinicName)
        clinicName.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
        }
      
        addSubview(timeWork)
        timeWork.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-10)
        }
        
    }
    
    func setupBackground() -> Void {
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layer.cornerRadius = 10
        layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        layer.borderWidth = 0.15
    }
    lazy var clinicName: UILabel = {
        let clinicName = UILabel()
        clinicName.text = "N.One - Oinamaqo"
        clinicName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        clinicName.font = UIFont.boldSystemFont(ofSize: 15)
        
        return clinicName
    }()
  
    lazy var timeWork: UILabel = {
        let timeWork = UILabel()
        timeWork.text = "5:49"
        timeWork.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        timeWork.font = .systemFont(ofSize:10)
        
        return timeWork
    }()
    
}
