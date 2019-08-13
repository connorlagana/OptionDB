//
//  NewsController.swift
//  OptionDB
//
//  Created by Connor Lagana on 8/12/19.
//  Copyright © 2019 Connor Lagana. All rights reserved.
//

import UIKit
import SDWebImage

class NewsController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var arrayOfNewsArticles = [Article]()
    
    let cellId = "NobodyComparesToYou"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        collectionView.register(NewsCell.self, forCellWithReuseIdentifier: cellId)
        
        getNewsArticles()
        view.addSubview(noNewsLabel)
        
        noNewsLabel.fillSuperview()
        noNewsLabel.isHidden = true
    }
    
    let noNewsLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "There are no news available for this stock at this time. Please check back later."
        lbl.font = UIFont(name: "TamilSangamMN", size: 18)
        lbl.textColor = .black
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        
        return lbl
    }()
    
    func getNewsArticles() {
        let urlString = "https://newsapi.org/v2/everything?q=\(ticker)&from=2019-08-13&sortBy=popularity&apiKey=161768bbaa4e4ad68dcd540292df6082"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                let new = try JSONDecoder().decode(News.self, from: data)
                
                DispatchQueue.main.async {
                    for i in 0..<new.articles.count {
                        self.arrayOfNewsArticles.append(new.articles[i])
                        print(i)
                    }
                    self.collectionView.reloadData()
                }
                if new.articles.count == 0 {
                    self.noNewsLabel.isHidden = false
                }
                
            }
                
            catch let err {
                print(err)
            }
            
            
            }.resume()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! NewsCell
        cell.image.sd_setImage(with: URL(string: arrayOfNewsArticles[indexPath.item].urlToImage))
        cell.titleLabel.text = arrayOfNewsArticles[indexPath.item].title
        cell.articleLabel.text = arrayOfNewsArticles[indexPath.item].content
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("ween")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 30, height: view.frame.height - 40)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfNewsArticles.count
    }
    
}
