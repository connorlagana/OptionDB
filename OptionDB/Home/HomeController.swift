//
//  HomeController.swift
//  OptionDB
//
//  Created by Connor Lagana on 8/12/19.
//  Copyright © 2019 Connor Lagana. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "Shrek3OnBluRay"
    
    let arrayOfStockTickers = ["TSLA", "AAPL", "AMZN", "KO", "MU", "AMD", "ANET", "SFIX", "BABA", "OKTA", "WIFI"]
    
    var arrayOfStocksEverything = [Stock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(HomeHoldingCell.self, forCellWithReuseIdentifier: cellId)
        
        for item in arrayOfStockTickers {
            let urlString = "https://sandbox.iexapis.com/stable/stock/\(item)/quote?token=Tpk_fbd8739ff2c045c6a907a8dbb050665e"
//            print(item)
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                
                guard let data = data else { return }
                
                do {
                    let stock = try JSONDecoder().decode(Stock.self, from: data)
                    self.arrayOfStocksEverything.append(stock)
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
//                    print(self.arrayOfStocksEverything)
                }
                    
                catch let err {
                    print(err)
                }
                
                
                }.resume()
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeHoldingCell
        cell.tickerLabel.text = arrayOfStocksEverything[indexPath.item].symbol
//        print(arrayOfStocksEverything[indexPath.item])
        cell.nameLabel.text = arrayOfStocksEverything[indexPath.item].companyName
        
        cell.priceLabel.text = "$\(arrayOfStocksEverything[indexPath.item].latestPrice)"
        cell.percentageLabel.text = "\(arrayOfStocksEverything[indexPath.item].changePercent*100)%"
        
        if arrayOfStocksEverything[indexPath.item].changePercent >= 0 {
            cell.isPositive = true
        } else {
            cell.isPositive = false
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! HomeHoldingCell
        guard let tck = selectedCell.tickerLabel.text else { return }
        navigationController?.pushViewController(StockInfoController(), animated: true)
        ticker = tck
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfStocksEverything.count
    }
    
}
