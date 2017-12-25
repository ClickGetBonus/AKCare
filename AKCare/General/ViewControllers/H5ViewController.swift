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
    var complete: (() -> Void)?
    
    var url: URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: "H5ViewController", bundle: nil)
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navBarBgAlpha = 1.0
        self.webView.loadRequest(URLRequest(url: self.url))
        
        self.setupBackItem(selector: #selector(UIViewController.onBack))
    }
    
    override func onBack() {
        
        if complete != nil {
            complete!()
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
