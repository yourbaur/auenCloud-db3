//
//  RegistrationButtonView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class RegistrationButtonView: UIView {
    
    //MARK: - Properties

    lazy var regButton = SecondButton(title: "Создать аккаунт")

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    //MARK: - Setup functions
    private func setupView() -> Void {
        addSubview(regButton)
        regButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(50)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            //make.bottom.equalToSuperview()
        }
        
     
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
