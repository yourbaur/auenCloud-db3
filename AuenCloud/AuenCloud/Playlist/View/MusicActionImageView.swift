//
//  MusicActionImageView.swift
//  AuenCloud
//
//  Created by Admin on 12/4/20.
//

import Foundation
import UIKit

class MusicActionImageView: UIView {

    //    MARK: - Properties
    lazy var actionImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    
    //    MARK: - Initialization
    
    init(image: UIImage) {
        super.init(frame: .zero)
        actionImage.image = image
        layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        setupView()
        setupActions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //    MARK: - Lifecycle
    
    //    MARK: - Setup functions
    
    private func setupView() -> Void {
        addSubview(actionImage)
        actionImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.width.equalToSuperview()
        }
        
    }
    
    private func setupActions() -> Void {
        
    }
    
    //    MARK: - Simple functions
    
    
    
    //    MARK: - Objc functions

}

