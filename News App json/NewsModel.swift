//
//  NewsModel.swift
//  News App json
//
//  Created by Yermakov Anton on 28.03.2018.
//  Copyright © 2018 Yermakov Anton. All rights reserved.
//

import Foundation

struct NewsModel {
    
    var author : String
    var title : String
    var description : String
    var url : String
    var urlToImage : String
    
    
    
    enum SerializationError : Error {
        case missing(String)
    }
    
    init(json: [String: Any]) throws {
        
        guard let author = json["author"] as? String else { throw SerializationError.missing("The author is missing") }
        guard let title = json["title"] as? String else { throw SerializationError.missing("The title is missing") }
        guard let description = json["description"] as? String else { throw SerializationError.missing("The description is missing") }
        guard let url = json["url"] as? String else { throw SerializationError.missing("The url is missing") }
        guard let urlToImage = json["urlToImage"] as? String else { throw SerializationError.missing("The urlToImageis missing") }
        
        self.author = author
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
    }
    
} // struct

