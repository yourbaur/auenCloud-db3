//
//  SignInEventView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit
import BEMCheckBox

class SignInEventsView: UIView, BEMCheckBoxDelegate {
    
    //MARK: - Properties
    lazy var signInButton = MainButton(title: "Войти")
    
    
    lazy var forgetButton: UIButton = {
        let rb = UIButton()
        rb.titleLabel?.textColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        let yourAttributes : [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)]
        let attString = NSMutableAttributedString(string: "Забыли пароль?",
                                                  attributes: yourAttributes)
        
        rb.setAttributedTitle(attString, for: .normal)
        
        return rb
    }()
  
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    //MARK: - Setup functions
    private func setupView() -> Void {
        addSubview(signInButton)
        addSubview(forgetButton)
        
        signInButton.snp.makeConstraints { (make) in
            make.top.equalTo(forgetButton.snp.bottom).offset(12)
            make.height.equalTo(50)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalToSuperview()
        }
      

        forgetButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(30)
        }

    }
 
    //    MARK: - Simple functions
    
    func didTap(_ checkBox: BEMCheckBox) {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
