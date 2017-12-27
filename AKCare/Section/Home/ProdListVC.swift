//
//  ProdListVC.swift
//  AKCare
//
//  Created by Aki on 2017/12/26.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class ProdListVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }
    
    var prodTypeId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func configure(prodTypeId: String) {
        
        
    }
}
