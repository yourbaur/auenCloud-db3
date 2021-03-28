//
//  BaseAuthorizationViewController.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class BaseAuthorizationViewController: ScrollViewController {
    
    //MARK: - Properties
    let paragraphStyle = NSMutableParagraphStyle()
    lazy var logoImage: UIImageView = {
        let li = UIImageView(image: #imageLiteral(resourceName: "Frame 58"))
        li.contentMode = .scaleAspectFit
        li.layer.cornerRadius = 10
        li.clipsToBounds = true
        
        return li
    }()
    lazy var welcomeLabel: UILabel = {
        var welcome = UILabel()
        paragraphStyle.lineSpacing = 4
        welcome.textColor = .mainColor
        
        welcome.lineBreakMode = .byWordWrapping
        welcome.numberOfLines = 0
        welcome.attributedText = NSMutableAttributedString(string: "С возвращением!", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        welcome.textAlignment = .left
        
        return welcome
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupBackground()
        buildLayout()
    }
    
    //MARK: - Setup functions
    func setupBackground() -> Void {
        edgesForExtendedLayout = []
        view.backgroundColor = UIColor.white
    }

    //MARK: - functions
    func buildLayout() -> Void {
        
        scrollView.addSubview(logoImage)
        logoImage.snp.makeConstraints { (make) in
            make.top.equalTo(83)
            make.centerX.equalToSuperview()
            make.width.equalTo(142)
            make.height.equalTo(157)
        }
        scrollView.addSubview(welcomeLabel)
        welcomeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(34)
        }
    }
}
