//
//  LoginViewController.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit
import SwiftPhoneNumberFormatter

class LoginViewController: BaseAuthorizationViewController {
    //MARK: - Properties
    let loginViewModel = LoginViewModel()
    
    
    lazy var autorizationInputView = AutorizationInputView()
    lazy var signInEventsView = SignInEventsView()
    lazy var regButton = RegistrationButtonView()
    
    //MARK: - Start functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    func setupActions() {
        regButton.regButton.secondButton.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
        signInEventsView.signInButton.mainButton.addTarget(self, action: #selector(goToMainController), for: .touchUpInside)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.478, green: 0.694, blue: 0.863, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    //MARK: - Setup functions
    private func setupView() -> Void {
        LoginControllerConstaintConfiguration.shared.setupView(self)

    }
  
    //MARK: - Simple functions
    @objc func goToMainController() -> Void {
        loginViewModel.getProfileData()
        loginViewModel.profile.observe(on: self) { (example) in
            print(example)
            
        }
        AppCenter.shared.makeMainRootController()
    }
    
    func isValidateEmail() -> Bool {
        if !autorizationInputView.emailTextField.textField.text!.isEmpty {
            for char in autorizationInputView.emailTextField.textField.text! {
                if char == "@" {
                    return true
                }
            }
            return false
        }
        return true
    }

    
    func isValidate() -> Bool {
        guard !autorizationInputView.emailTextField.textField.text!.isEmpty else {
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
    @objc func goToRegister() {
        self.navigationController?.pushViewController(RegisterViewController().inNavigation(), animated: true)
    }
  

}
