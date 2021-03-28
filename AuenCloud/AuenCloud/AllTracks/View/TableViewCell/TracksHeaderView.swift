//
//  TracksHeaderView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class TracksHeaderView: UITableViewHeaderFooterView {

    //MARK: - Properties
    var actionEvent = {()->() in}
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.textColor = #colorLiteral(red: 0.5058823529, green: 0.5490196078, blue: 0.6, alpha: 1)
        title.text = "Ваши дети"
        
        return title
    }()
    lazy var vectorImage = UIImageView(image: #imageLiteral(resourceName: "home"))
    lazy var button = UIButton()
    
    //MARK: Initialization
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        tintColor = .clear
        backgroundView?.backgroundColor = .clear
        backgroundColor = .clear
        setupViews()
        setupAction()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup functions
    private func setupViews() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 35, bottom: 5, right: -15))
        }
        addSubview(vectorImage)
        vectorImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalTo(4)
            make.width.equalTo(10)
            make.right.equalTo(-15)
        }
        addSubview(button)
        button.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupAction() -> Void {
        button.addTarget(self, action: #selector(actionLabel), for: .touchUpInside)
    }
    
    func actionEnabled(_ bool: Bool) -> Void {
        vectorImage.isHidden = !bool
        button.isUserInteractionEnabled = bool
    }

    //MARK: Objective function
    @objc func actionLabel() {
        actionEvent()
    }
}
