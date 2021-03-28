//
//  MainButton.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation

import UIKit

class MainButton: UIView {
    
    //MARK: - Properties
    var title: String
    lazy var mainButton: UIButton = {
        var sib = UIButton()
        sib.setTitle(title, for: .normal)
        
        sib.tintColor = .white
        sib.backgroundColor = .mainColor
        sib.layer.cornerRadius = 16
        
        return sib
    }()
    
    //MARK: - Initialization
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        setupView()
    }
    
    //MARK: - Setup functions
    private func setupView() -> Void {
        addSubview(mainButton)
        mainButton.snp.makeConstraints { (make) in
            make.right.left.bottom.top.equalToSuperview()
            make.height.equalTo(50)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
