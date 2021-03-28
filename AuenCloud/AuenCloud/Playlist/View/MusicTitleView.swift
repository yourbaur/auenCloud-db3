//
//  MusicTitleView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class MusicTitleView: UIView {
    //    MARK: - Properties
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Спокойствие с Анной Твен"
        label.textColor = #colorLiteral(red: 0.075, green: 0.075, blue: 0.078, alpha: 1)
        label.textAlignment = .center

        return label
    }()
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = #colorLiteral(red: 0.478, green: 0.478, blue: 0.478, alpha: 1)
       
        label.textAlignment = .center
        
        return label
    }()

    
    //    MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setupActions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    MARK: - Lifecycle
    
    //    MARK: - Setup functions
    
    private func setupView() -> Void {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
//        addSubview(subtitleLabel)
//        subtitleLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(titleLabel.snp.bottom).offset(12)
//            make.bottom.left.right.equalToSuperview()
//        }
        
    }
    
    private func setupActions() -> Void {

    }
    
    //    MARK: - Simple functions
    
    
    
    //    MARK: - Objc functions
    
    

}
