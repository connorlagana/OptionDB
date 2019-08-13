//
//  NewsCells.swift
//  OptionDB
//
//  Created by Connor Lagana on 8/12/19.
//  Copyright © 2019 Connor Lagana. All rights reserved.
//

import UIKit


class NewsCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    let image: UIImageView = {
        let img = UIImageView()
//        img.backgroundColor = .gray
        img.layer.cornerRadius = 12
        img.clipsToBounds = true
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        
        return img
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Tesla Hits $420.69 funding secured in a matter of seconds because fuck yeah get money"
        lbl.font = UIFont(name: "TamilSangamMN-Bold", size: 28)
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let articleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Tesla is legit the best company in the world. Not only that, but i am actually obsessed with my girlfriend, Rachel. She has the cutest nose in the world <3333"
        lbl.font = UIFont(name: "TamilSangamMN", size: 18)
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    
    
    func setupUI() {
        backgroundColor = .white
        
        addSubview(image)
        addSubview(titleLabel)
        addSubview(articleLabel)
        
        image.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        image.leftAnchor.constraint(equalTo: leftAnchor, constant: 6).isActive = true
        image.heightAnchor.constraint(equalToConstant: 110).isActive = true
        image.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: image.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: image.rightAnchor, constant: 4).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        articleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 6).isActive = true
        articleLabel.leftAnchor.constraint(equalTo: image.leftAnchor).isActive = true
        articleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -6).isActive = true
        articleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -6).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
