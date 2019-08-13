//
//  IndyCells.swift
//  OptionDB
//
//  Created by Connor Lagana on 8/12/19.
//  Copyright © 2019 Connor Lagana. All rights reserved.
//

import UIKit


class IndyCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "News"
        lbl.font = UIFont(name: "TamilSangamMN-Bold", size: 34)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let newsController = NewsController()
    
    func setupUI() {
//        backgroundColor = .cyan
        
        
        
        addSubview(titleLabel)
//        titleLabel.fillSuperview()
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(newsController.view)
        
        newsController.view.translatesAutoresizingMaskIntoConstraints = false
        newsController.view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        newsController.view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        newsController.view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        newsController.view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
