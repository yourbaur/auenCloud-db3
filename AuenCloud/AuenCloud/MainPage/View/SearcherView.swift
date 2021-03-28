//
//  SearcherView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class SearcherView: UIView {
    
    // MARK: - Properties
    lazy var searchTextField:  UITextField = {
        let text = UITextField()
        text.layer.cornerRadius = 15.0
        
        text.backgroundColor = .white
        text.placeholder = "Поиск"
        text.returnKeyType = .search
        text.attributedPlaceholder = NSAttributedString(string: "Поиск", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6470588235, green: 0.662745098, blue: 0.7058823529, alpha: 1)])
        return text
    }()
    
    lazy var micButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "mic"), for: .normal)
        //button.addTarget(self, action: #selector(tapEye(button:)), for: .touchUpInside)
        return button
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "search"), for: .normal)
        //button.addTarget(self, action: #selector(tapEye(button:)), for: .touchUpInside)
        return button
    }()


    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
    
    
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.shadowColor = UIColor.black.cgColor//UIColor.gray.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
        layer.cornerRadius = 20
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupViews
    func setupViews() {
        addSubview(searchTextField)
      
        searchTextField.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-8)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(40)
        }
        searchTextField.leftView = paddingView
        searchTextField.leftViewMode = .always
        
        addSubview(micButton)
        micButton.snp.makeConstraints { (make) in
            make.right.equalTo(searchTextField).offset(-8)
            make.centerY.equalTo(searchTextField)
            make.width.height.equalTo(25)
        }
        addSubview(searchButton)
        searchButton.snp.makeConstraints { (make) in
            make.left.equalTo(searchTextField).offset(10)
            make.centerY.equalTo(searchTextField)
            make.width.height.equalTo(25)
        }


    }
}
