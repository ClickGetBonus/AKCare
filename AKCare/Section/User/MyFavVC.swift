//
//  MyFavVC.swift
//  AKCare
//
//  Created by Aki on 2018/2/8.
//  Copyright © 2018年 Ian. All rights reserved.
//

import UIKit

class MyFavVC: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(ProdCell.nib, forCellReuseIdentifier: ProdCell.className)
            tableView.tableFooterView = UIView()
        }
    }
    
    var favProds: [Product]?
    var needUpdate: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackItem()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if needUpdate {
            
            AKApi.send(request: ProdFavListRequest(sid: AKUserManager.getSid(), startDataId: "")) { [unowned self] (response) in
                
                if let response = response {
                    self.favProds = response.prods
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.reloadData()
                }
                
                self.needUpdate = false
            }
        }
    }
}


// MARK: - UITableView Deleagate & DataSource
extension MyFavVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favProds?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProdCell.className) as! ProdCell
        cell.configure(by: (favProds?[indexPath.row])!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ProdCell.CellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc: ProdInfoVC = R.storyboard.home.prodInfoVC()!
        vc.product = self.favProds![indexPath.row]
        vc.favIsChangeBehavior = { [unowned self] in self.needUpdate = $0 }
        self.show(vc, sender: nil)
    }
}
