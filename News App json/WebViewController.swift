//
//  WebViewController.swift
//  News App json
//
//  Created by Yermakov Anton on 28.03.18.
//  Copyright © 2018 Yermakov Anton. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var myWebView: WKWebView!
    
    var url: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWebView.load(URLRequest(url: URL(string: url!)!))
        
    }

} //class
