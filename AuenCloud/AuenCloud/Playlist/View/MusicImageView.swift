//
//  MusicImageView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//
import Foundation
import UIKit

class MusicImageView: UIView {
    
    //    MARK: - Properties
    var getToFavourite: (() -> ())?
    lazy var backView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = false
//        view.contentMode = .scaleToFill
        
        return view
    }()
    lazy var musicImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "130713467-line-art-music-note-icon-black-doodle-musical-signs-signature-note-symbol-for-web-site-design-and-mo"))
        image.layer.cornerRadius = 15
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    lazy var saveImageView: MusicActionImageView = {
        let view = MusicActionImageView(image: #imageLiteral(resourceName: "save"))
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.isUserInteractionEnabled = true
        
        return view
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.isUserInteractionEnabled = true

        return button
    }()

    
    //    MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
        setupActions()
        setupRecognizer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    MARK: - Lifecycle
    
    //    MARK: - Setup functions
    
    override func layoutIfNeeded() {
//        musicImage.snp.updateConstraints { (make) in
//            make.top.equalTo(UIScreen.main.bounds.height/40)
//            make.centerX.bottom.equalToSuperview()
//            make.width.equalTo((UIScreen.main.bounds.width < 321) ? 100 : musicImage.snp.height)
//        }

    }
    
    private func setupView() -> Void {
        addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.top.equalTo(UIScreen.main.bounds.height/40)
            make.centerX.bottom.equalToSuperview()
            make.width.equalTo((UIScreen.main.bounds.width < 321) ? 100 : 260)
            make.height.equalTo((UIScreen.main.bounds.width < 321) ? 100 : 260)
        }

        backView.addSubview(musicImage)
        musicImage.snp.makeConstraints { (make) in
            make.center.width.height.equalToSuperview()
//            make.top.equalTo(UIScreen.main.bounds.height/40)
//            make.centerX.bottom.equalToSuperview()
//            make.width.equalTo((UIScreen.main.bounds.width < 321) ? 100 : musicImage.snp.height)
        }

//        musicImage.addSubview(likeImageView)
//        likeImageView.snp.makeConstraints { (make) in
//            make.left.top.equalTo(10)
//            make.height.width.equalTo(30)
//        }
        backView.addSubview(saveImageView)
        saveImageView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.height.width.equalTo(30)
        }
    }
    
    private func setupActions() -> Void {
        saveButton.addTarget(self, action: #selector(titleAction), for: .touchUpInside)
    }
    
    private func setupRecognizer() -> Void {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(titleAction))
        saveImageView.addGestureRecognizer(gesture)
    }
    
    @objc func titleAction() -> Void {
        self.getToFavourite?()
    }

    
    //    MARK: - Simple functions
    
    
    
    //    MARK: - Objc functions
    
}
