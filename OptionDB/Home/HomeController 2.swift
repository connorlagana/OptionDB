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
    
    let arrayOfStocks = ["TSLA", "AAPL", "AMZN", "KO", "MU", "AMD", "ANET", "SFIX", "BABA"]
    
    var arrayOfCompanyNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(HomeHoldingCell.self, forCellWithReuseIdentifier: cellId)
        
        for item in arrayOfStocks {
            let urlString = "https://sandbox.iexapis.com/stable/stock/\(item)/quote?token=Tpk_fbd8739ff2c045c6a907a8dbb050665e"
//            print(item)
            guard let url = URL(string: urlString) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, err) in
                
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let stock = try JSONDecoder().decode(Stock.self, from: data)
                        self.arrayOfCompanyNames.append(stock.companyName)
                        print(stock.companyName)
                        //                    print(self.arrayOfCompanyNames)
                        
                        //                    print(self.arrayOfStocks)
                    }
                        
                    catch let err {
                        print(err)
                    }
                }
                
                
                
                }.resume()
        }
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! HomeHoldingCell
        cell.tickerLabel.text = arrayOfStocks[indexPath.item]
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
        return arrayOfStocks.count
    }
    
}
