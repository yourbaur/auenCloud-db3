//
//  TimerButton.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class TimerButton: UIView {

    //    MARK: - Properties
    lazy var backView: UIView = {
        let view = UIView()

        return view
    }()
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitleColor(#colorLiteral(red: 0.478, green: 0.694, blue: 0.863, alpha: 1), for: .normal)
        button.layer.cornerRadius = 14
        button.titleEdgeInsets = UIEdgeInsets(top: 10,left: 5,bottom: 10,right: 5)
        
        return button
    }()
    //    MARK: - Initialization
    
     init(title: String) {
        super.init(frame: .zero)
        button.setTitle(title, for: .normal)
        setupView()
        setupActions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    MARK: - Lifecycle
    
    //    MARK: - Setup functions
    
    private func setupView() -> Void {
        addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        backView.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(-10)
        }
    }
    
    private func setupActions() -> Void {
    }
    
    //    MARK: - Simple functions
    
    
    
    //    MARK: - Objc functions
    
    @objc func buttonAction(sender: UIButton) -> Void {
    }
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    

}
