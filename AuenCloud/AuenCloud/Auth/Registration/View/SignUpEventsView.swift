//
//  SignUpEventView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit
import BEMCheckBox

class SignUpEventsView: UIView, BEMCheckBoxDelegate {
    
    //MARK: - Properties
    lazy var signUpButton = MainButton(title: "Создать аккаунт")
    

    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    //MARK: - Setup functions
    private func setupView() -> Void {
        addSubview(signUpButton)

        signUpButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(50)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalToSuperview()
        }
      

    }
 
    //    MARK: - Simple functions
    
    func didTap(_ checkBox: BEMCheckBox) {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
