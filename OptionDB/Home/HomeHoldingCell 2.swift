//
//  HomeHoldingCell.swift
//  OptionDB
//
//  Created by Connor Lagana on 8/12/19.
//  Copyright © 2019 Connor Lagana. All rights reserved.
//

import UIKit

let greenColor = UIColor.init(red: 10/255, green: 255/255, blue: 150/255, alpha: 1)

class HomeHoldingCell: UICollectionViewCell {
    
    var isPositive = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    let tickerLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "TSLA"
        lbl.font = UIFont(name: "TamilSangamMN-Bold", size: 32)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Tesla, Inc."
        lbl.font = UIFont(name: "TamilSangamMN", size: 20)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let percentageLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "+4.20%"
        lbl.font = UIFont(name: "TamilSangamMN-Bold", size: 26)
        lbl.textColor = greenColor
        lbl.textAlignment = .right
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "$325.69"
        lbl.font = UIFont(name: "TamilSangamMN-Bold", size: 26)
        lbl.textColor = .white
        lbl.backgroundColor = greenColor
        lbl.layer.cornerRadius = 12
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    func setupUI() {
        //        backgroundColor = .cyan
        
        addSubview(tickerLabel)
        addSubview(nameLabel)
        addSubview(priceLabel)
        addSubview(percentageLabel)
        
        tickerLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        tickerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: tickerLabel.bottomAnchor, constant: 4).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: tickerLabel.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: percentageLabel.leftAnchor, constant: -4).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 38).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -38).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        percentageLabel.rightAnchor.constraint(equalTo: priceLabel.leftAnchor, constant: -6).isActive = true
        percentageLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        percentageLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        
        if isPositive == false {
            percentageLabel.textColor = .red
            priceLabel.backgroundColor = .red
        } else if isPositive == true {
            
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
