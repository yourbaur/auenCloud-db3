//
//  AutorizationInputView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class AutorizationInputView: UIView {
    
    //MARK: - Properties
    lazy var authorizationTitle: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.textColor = .mainColor
        
        return label
    }()
    lazy var emailTextField: InputTextField = {
        let textField = InputTextField(frame: .zero, inputType: .phone, title: "", placeholder: "7(7##) ###-##-##", icon: nil, heightAnchor: 45)
        textField.layer.cornerRadius = 22.5
        textField.textField.keyboardType = .numberPad
        return textField
    }()
    lazy var passwordTextField: InputTextField = {
        let textField = InputTextField(frame: .zero, inputType: .secureText, title: "", placeholder: "••••••••", icon: #imageLiteral(resourceName: "Union-3"), heightAnchor: 45)
        textField.layer.cornerRadius = 22.5
        textField.textField.isSecureTextEntry = true
        textField.iconAction = {
            self.visibility()
        }
        
        return textField
    }()
    
    //MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    //MARK: - Setup functions
    private func setupView() -> Void {
        addSubview(authorizationTitle)
        authorizationTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(26)
            make.right.equalToSuperview().offset(-20)
        }
        
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(authorizationTitle.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
    }
    
    func visibility() {
        self.passwordTextField.textField.isSecureTextEntry = !self.passwordTextField.textField.isSecureTextEntry
        if self.passwordTextField.textField.isSecureTextEntry {
            passwordTextField.iconView.image = #imageLiteral(resourceName: "Union-3")
        } else {
            passwordTextField.iconView.image = #imageLiteral(resourceName: "Union-3")
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
