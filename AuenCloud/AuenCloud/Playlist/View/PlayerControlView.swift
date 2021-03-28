//
//  PlayerControlView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class PlayerControllView: UIView {

    //    MARK: - Properties
    lazy var playView: UIButton = {
        let image = UIButton()
        image.setImage(#imageLiteral(resourceName: "Setting"), for: .normal)
        
        return image
    }()
    lazy var fifteenToFwrd: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Setting"), for: .normal)
        button.tag = 1
        
        return button
    }()
    lazy var fifteenToBack: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "Setting"), for: .normal)
        
        return button
    }()
    lazy var toNext: UIButton = {
        let image = UIButton()
        image.setImage(#imageLiteral(resourceName: "Setting"), for: .normal)
        
        return image
    }()
    lazy var toPrevious: UIButton = {
        let image = UIButton()
        image.setImage(#imageLiteral(resourceName: "Setting"), for: .normal)
        
        return image
    }()
    //    MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setupActions()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    MARK: - Lifecycle
    
    //    MARK: - Setup functions
    
    private func setupView() -> Void {
        addSubview(playView)
        playView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(36)
        }
        addSubview(toPrevious)
        toPrevious.snp.makeConstraints { (make) in
            make.centerY.equalTo(playView)
            make.centerX.equalToSuperview().dividedBy(2)
            make.width.equalTo(24)
            make.height.equalTo(20)
        }
        addSubview(fifteenToBack)
        fifteenToBack.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.centerY.equalTo(playView)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        addSubview(fifteenToFwrd)
        fifteenToFwrd.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.centerY.equalTo(playView)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        addSubview(toNext)
        toNext.snp.makeConstraints { (make) in
            make.centerY.equalTo(playView)
            make.centerX.equalToSuperview().multipliedBy(1.5)
            make.width.equalTo(24)
            make.height.equalTo(20)
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
