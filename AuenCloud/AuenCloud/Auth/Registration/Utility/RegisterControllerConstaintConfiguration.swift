//
//  RegisterControllerConstaintConfiguration.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit
class RegisterControllerConstaintConfiguration {
    
    //Setup constraints for LoginViewController()
    
    static let shared = RegisterControllerConstaintConfiguration()
    
    func setupView(_ controller: RegisterViewController) -> Void {
        controller.scrollView.addSubview(controller.loginButton)
        controller.scrollView.addSubview(controller.autorizationInputView)
        controller.scrollView.addSubview(controller.signInEventsView)
    
        
        controller.autorizationInputView.snp.makeConstraints { (make) in
            make.top.equalTo(controller.welcomeLabel.snp.bottom).offset(38)
            make.width.equalToSuperview()
        }
        controller.signInEventsView.snp.makeConstraints { (make) in
            make.top.equalTo(controller.autorizationInputView.snp.bottom).offset(11)
            make.left.right.centerX.equalToSuperview()
        }
        controller.loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(controller.signInEventsView.snp.bottom).offset(13)
            make.height.equalTo(50)
            make.left.right.equalToSuperview()
            
        }
    }
}
