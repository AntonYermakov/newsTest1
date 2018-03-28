//
//  News.swift
//  News App json
//
//  Created by Yermakov Anton on 28.03.18.
//  Copyright © 2018 Yermakov Anton. All rights reserved.
//

import Foundation


struct NewsNetworkingProcessor {
    
    
    static func dowloadJson(fromProvider provider: String, completion: @escaping ([NewsModel]) -> ()) {
        
        let url = provider
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            var newsArray : [NewsModel] = []
            
            guard let data = data else { return }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                    if let articlesInfo = json["articles"] as? [[String: Any]] {
                        for articlesPoint in articlesInfo {
                            if let articlesObject = try? NewsModel(json: articlesPoint) {
                                newsArray.append(articlesObject)
                            }
                        }
                    }
                }
                
            } catch {
                print(error.localizedDescription)
            }
            
            completion(newsArray)
        }
        task.resume()
    }
    
}





