//
//  StockController.swift
//  OptionDB
//
//  Created by Connor Lagana on 8/12/19.
//  Copyright © 2019 Connor Lagana. All rights reserved.
//

import UIKit
import Charts
import Lottie

var ticker = ""
class StockInfoController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getStockData()
        getNewsArticles()
        
    }
    
    let tickerLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "TamilSangamMN-Bold", size: 32)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "TamilSangamMN", size: 20)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //        lbl.backgroundColor = .yellow
        
        return lbl
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.font = UIFont(name: "TamilSangamMN-Bold", size: 56)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        //        lbl.backgroundColor = .yellow
        
        return lbl
    }()
    
    let newsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "News"
        lbl.font = UIFont(name: "TamilSangamMN-Bold", size: 50)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    let num = PieChartDataEntry(value: 15)
    let num2 = PieChartDataEntry(value: 5)
    var dataEntry = [PieChartDataEntry]()
    
    let pieChart: PieChartView = {
        let pie = PieChartView()
        pie.translatesAutoresizingMaskIntoConstraints = false
        return pie
    }()
    
    func setupUI() {
        view.backgroundColor = .white
        dataEntry = [num, num2]
        let data = PieChartDataSet(entries: dataEntry, label: "Hello")
        pieChart.data = PieChartData(dataSet: data)
        data.colors = [UIColor.blue, UIColor.purple]
        
        view.addSubview(tickerLabel)
        view.addSubview(nameLabel)
        view.addSubview(priceLabel)
//        view.addSubview(pieChart)
        
        tickerLabel.text = ticker
        
        tickerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        tickerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: tickerLabel.bottomAnchor, constant: 4).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: tickerLabel.centerXAnchor).isActive = true
        
        priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        
//        pieChart.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
//        pieChart.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
//        pieChart.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
//        pieChart.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    func getStockData() {
        let urlString = "https://sandbox.iexapis.com/stable/stock/\(ticker)/quote?token=Tpk_fbd8739ff2c045c6a907a8dbb050665e"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                let stock = try JSONDecoder().decode(Stock.self, from: data)
                
                DispatchQueue.main.async {
                    let price = stock.latestPrice
                    self.nameLabel.text = stock.companyName
                    self.priceLabel.text = "\(price)"
                }
                
                
            }
                
            catch let err {
                print(err)
            }
            
            
            }.resume()
    }
    
    func getNewsArticles() {
        let urlString = "https://newsapi.org/v2/everything?q=\(ticker)&from=2019-08-13&sortBy=popularity&apiKey=161768bbaa4e4ad68dcd540292df6082"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                let new = try JSONDecoder().decode(News.self, from: data)
                
                DispatchQueue.main.async {
                    print(new.articles[0].title)
                }
                
                
            }
                
            catch let err {
                print(err)
            }
            
            
            }.resume()
    }
    
    func runAnimation() {
        
    }
}
