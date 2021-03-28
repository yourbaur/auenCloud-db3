//
//  ProfileView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

final class ProfileView: UIView {
    var profileImage : UIImageView = {
        var image = UIImageView()
            image.image = #imageLiteral(resourceName: "Frame 174")
            image.clipsToBounds = true
            image.layer.cornerRadius = 35
            image.contentMode = .scaleAspectFit
        
        return image
    }()
    var profileName : UILabel = {
        var label = UILabel()
            label.text = "Бауыржан Тайманов"
            label.textColor = .black
            
        return label
    }(
    )
    lazy var premiumButton: UIButton = {
            let button = UIButton()
            button.setTitle("BASIC", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 12)
            button.layer.cornerRadius = 8
            button.layer.masksToBounds = true
            button.backgroundColor = #colorLiteral(red: 0.9882352941, green: 0.7411764706, blue: 0, alpha: 1)

            return button
        }()

    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        setupView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView(){
        isUserInteractionEnabled = true
        addSubview(profileImage)
        profileImage.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(30)
            make.width.height.equalTo(70)
        }
        addSubview(profileName)
        profileName.snp.makeConstraints { (make) in
            make.left.equalTo(profileImage.snp.right).offset(12)
            make.top.equalTo(profileImage).offset(10)
        }
        addSubview(premiumButton)
        premiumButton.snp.makeConstraints { (make) in
            make.left.equalTo(profileImage.snp.right).offset(12)
            make.top.equalTo(profileName).offset(25)
            make.width.equalTo(60)
        }
     
    }
}
