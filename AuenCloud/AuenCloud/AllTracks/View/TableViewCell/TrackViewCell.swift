//
//  TrackViewCell.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import UIKit

class TrackViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstrain()
        setupBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupConstrain() -> Void {
        addSubview(AptekiView)
        AptekiView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.8)
        }
    }
    func setupBackground() -> Void {
    }
    
    lazy var AptekiView = TrackView()
    
}
