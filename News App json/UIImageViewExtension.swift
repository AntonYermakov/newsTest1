//
//  UIImageViewExtension.swift
//  News App json
//
//  Created by Yermakov Anton on 28.03.2018.
//  Copyright © 2018 Yermakov Anton. All rights reserved.
//

import UIKit

extension UIImageView {
    func dowloadImage(from url: String){
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}
