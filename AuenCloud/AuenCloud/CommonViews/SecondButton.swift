//
//  SecondButton.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class SecondButton: UIView {
    
    //MARK: - Properties
    var title: String
    lazy var secondButton: UIButton = {
        var sib = UIButton()
        sib.setTitle(title, for: .normal)
        sib.setTitleColor(.mainColor, for: .normal)
        sib.backgroundColor = .notMainColor
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
        addSubview(secondButton)
        secondButton.snp.makeConstraints { (make) in
            make.right.left.bottom.top.equalToSuperview()
            make.height.equalTo(50)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
