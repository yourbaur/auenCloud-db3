//
//  RegisterViewController.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit
import SwiftPhoneNumberFormatter

class RegisterViewController: BaseAuthorizationViewController {
    //MARK: - Properties
    
    lazy var autorizationInputView = RegisterInputView()
    lazy var signInEventsView = SignUpEventsView()
    lazy var loginButton = LoginButtonView()
    
    //MARK: - Start functions
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Добро пожаловать!"
        setupView()
        setupActions()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.478, green: 0.694, blue: 0.863, alpha: 1)
    }
    
    func setupActions() {
        loginButton.loginButton.secondButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    //MARK: - Setup functions
    private func setupView() -> Void {
        RegisterControllerConstaintConfiguration.shared.setupView(self)
    }
  
    //MARK: - Simple functions
    func goToMainController() -> Void {
        AppCenter.shared.makeRootController()
    }
    
    func isValidateEmail() -> Bool {
        if !autorizationInputView.numberTextField.textField.text!.isEmpty {
            for char in autorizationInputView.numberTextField.textField.text! {
                if char == "@" {
                    return true
                }
            }
            return false
        }
        return true
    }

    
    func isValidate() -> Bool {
        guard !autorizationInputView.numberTextField.textField.text!.isEmpty else {
            self.showErrorMessage("Введите email")
            return false
        }
        guard isValidateEmail() else {
            self.showErrorMessage("Не правильно указали e-mail")
            return false
        }
        guard !autorizationInputView.passwordTextField.textField.text!.isEmpty else {
            self.showErrorMessage("Введите пароль")
            return false
            
        }
        guard let passwrd = autorizationInputView.passwordTextField.textField.text, passwrd.count > 5 else {
            self.showErrorMessage("Слишком слабый пароль")
            return false
        }
        return true
    }

    
    //    MARK: - Parse functions
    
    
    //    MARK: - Simple functions
    

    
    //MARK: - Objc functions
   
    @objc func goToLogin() {
        self.navigationController?.popViewController(animated: true)
    }

}
