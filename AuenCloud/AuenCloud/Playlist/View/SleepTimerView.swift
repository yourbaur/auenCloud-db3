//
//  SleepTimerView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class SleepTimerView: UIView {

    //    MARK: - Properties
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Отключить через (мин.)"
        label.textColor = #colorLiteral(red: 0.173, green: 0.184, blue: 0.2, alpha: 0.8)
        
        return label
    }()
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.973, green: 0.98, blue: 0.988, alpha: 1)
        view.layer.cornerRadius = 24
        
        return view
    }()
    lazy var stackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.backgroundColor = .clear

        return sv
    }()

    lazy var fiveMinButton: TimerButton = {
        let button = TimerButton(title: "5")
        button.button.tag = 0
        
        return button
    }()
    lazy var fifteenMinButton: TimerButton = {
        let button = TimerButton(title: "15")
        button.button.tag = 1
        
        return button
    }()
    lazy var thirtyMinButton: TimerButton = {
        let button = TimerButton(title: "30")
        button.button.tag = 2
        
        return button
    }()
    lazy var sixtyMinButton: TimerButton = {
        let button = TimerButton(title: "60")
        button.button.tag = 3
        
        return button
    }()

    var buttonArray = [UIButton]()

    //    MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        buttonArray = [fiveMinButton.button, fifteenMinButton.button, thirtyMinButton.button, sixtyMinButton.button]
        setupView()
        setupActions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    MARK: - Lifecycle
    
    //    MARK: - Setup functions
    
    private func setupView() -> Void {
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalToSuperview()
        }
        addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(48)
        }

        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(48)
        }
        
        stackView.addArrangedSubview(fiveMinButton)
        stackView.addArrangedSubview(fifteenMinButton)
        stackView.addArrangedSubview(thirtyMinButton)
        stackView.addArrangedSubview(sixtyMinButton)

    }
    
    private func setupActions() -> Void {
        fiveMinButton.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        fifteenMinButton.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        thirtyMinButton.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        sixtyMinButton.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    //    MARK: - Simple functions
    
    
    
    //    MARK: - Objc functions
    
    @objc func buttonAction(sender: UIButton) -> Void {
        for button in buttonArray {
            if sender == button {
                sender.setTitleColor(.white, for: .normal)
                sender.backgroundColor = .mainColor
            } else {
                button.setTitleColor(#colorLiteral(red: 0.478, green: 0.694, blue: 0.863, alpha: 1), for: .normal)
                button.backgroundColor = .clear
            }
        }
    }
    


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
