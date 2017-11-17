//
//  H5ViewController.swift
//  AKCare
//
//  Created by Aki on 2017/11/17.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class H5ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: "H5ViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navBarBgAlpha = 1.0
        self.webView.loadRequest(URLRequest(url: self.url))
    }
    
}
