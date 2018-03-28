//
//  ViewController.swift
//  News App json
//
//  Created by Yermakov Anton on 28.03.18.
//  Copyright © 2018 Yermakov Anton. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var newsArray = [NewsModel]()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        updateNews()
        tableView.rowHeight = 160
      
        }

    
    func updateNews(){
        
        NewsNetworkingProcessor.dowloadJson(fromProvider: "https://newsapi.org/v2/top-headlines?sources=abc-news&apiKey=cef6b1333e144d749dddfe849596b11d") { (results: [NewsModel]) in
            
              self.newsArray = results
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell
        
        cell.myTitle.text = newsArray[indexPath.row].title
        cell.myDescription.text = newsArray[indexPath.row].description
        cell.myImage.dowloadImage(from: newsArray[indexPath.row].urlToImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let webVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WEB") as! WebViewController
        
        webVC.url = newsArray[indexPath.row].url
        
        self.present(webVC, animated: true, completion: nil)
    }
    
    
} // class




