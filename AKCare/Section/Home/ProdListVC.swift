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
            tableView.register(R.nib.prodCell(), forCellReuseIdentifier: R.nib.prodCell.name)
            tableView.tableFooterView = UIView()
        }
    }
    
    var products: [Product] = []
    var prodTypeId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackItem()
        SwiftLoader.show(animated: true)
        
        AKApi.getProdList(prodTypeId: prodTypeId) { (response) in
            
            if let p = response?.prods {
                self.products = p
                self.tableView.reloadData()
            }
            SwiftLoader.hide()
        }
    }
    
    
}

extension ProdListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.prodCell.name, for: indexPath) as! ProdCell
        cell.configure(by: self.products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
