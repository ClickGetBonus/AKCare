//
//  ProdListVC.swift
//  AKCare
//
//  Created by Aki on 2017/12/26.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class ProdListVC: UIViewController {
    
    let searchController: UISearchController = UISearchController(searchResultsController: nil)
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(R.nib.prodCell(), forCellReuseIdentifier: R.nib.prodCell.name)
            tableView.tableFooterView = UIView()
        }
    }
    
    var products: [Product] = []
    var prodType: ProdType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = prodType.name
        self.setupBackItem()
        
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .always
            self.searchController.searchBar.barTintColor = UIColor.white
            self.navigationItem.searchController = self.searchController
        }
        
        self.refreshDown()
    }
    
    @objc func refreshDown() {
        
        SwiftLoader.show(animated: true)
        
        AKApi.send(request: ProdListRequest(sid: AKUserManager.getSid(), prodTypeId: prodType.id)) { (response) in
            
            if let p = response?.prods {
                self.products = p
                self.tableView.delegate = self
                self.tableView.dataSource = self
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
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = R.storyboard.home.prodInfoVC()!
        vc.product = self.products[indexPath.row]
        self.show(vc, sender: nil)
    }
}

extension ProdListVC: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        <#code#>
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        <#code#>
    }
    
    
    
    
}
