//
//  ProdTypeVC.swift
//  AKCare
//
//  Created by Aki on 2017/12/25.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class ProdTypeVC: UIViewController {
    
    var _selection: Int? = nil
    var selection: Int? {
        set {
            
            var deleteIndexs: [IndexPath] = []
            if let sel = _selection {
                if let beforeCell = tableView.cellForRow(at: IndexPath(row: 0, section: sel)) as? ProdTypeHeadCell {
                    beforeCell.deselect(animated: false)
                }
                deleteIndexs = (0 ..< types[sel].children.count).map { i in return IndexPath(row: i+1, section: sel) }
            }
            var insertIndexs: [IndexPath] = []
            if let sel = newValue {
                if let currentCell = tableView.cellForRow(at: IndexPath(row: 0, section: sel)) as? ProdTypeHeadCell {
                    currentCell.select(animated: false)
                }
                insertIndexs = (0 ..< types[sel].children.count).map { i in return IndexPath(row: i+1, section: sel) }
            }
            _selection = newValue
            
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: deleteIndexs, with: .automatic)
            self.tableView.insertRows(at: insertIndexs, with: .automatic)
            self.tableView.endUpdates()
        }
        get {
            return _selection
        }
    }
    
    
    var types: [ProdType] = []
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
//            tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
            tableView.register(ProdTypeCell.nib, forCellReuseIdentifier: ProdTypeCell.className)
            tableView.register(ProdTypeHeadCell.nib, forCellReuseIdentifier: ProdTypeHeadCell.className)
            tableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupBackItem()
        
        SwiftLoader.show(animated: true)
        AKApi.send(request: ProdTypeRequest(sid: AKUserManager.getSid())) { (response) in
            
            if let types = response?.firstLev {
                self.types = types
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.reloadData()
                if types.count > 0 {
                    self.selection = 0
                }
            }
            SwiftLoader.hide()
        }
    }
}

extension ProdTypeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == self.selection {
            return types[section].children.count + 1
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProdTypeHeadCell.className) as! ProdTypeHeadCell
            cell.typeLabel.text = types[indexPath.section].name
            indexPath.section == selection ? cell.select(animated: false) : cell.deselect(animated: false)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProdTypeCell.className) as! ProdTypeCell
            cell.productLabel.text = types[indexPath.section].children[indexPath.row-1].name
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return ProdTypeHeadCell.CellHeight
        } else {
            return ProdTypeCell.CellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            self.selection = indexPath.section == selection ? nil : indexPath.section
        } else {
            
            let vc = R.storyboard.home.prodListVC()!
            vc.prodTypeId = self.types[indexPath.section].children[indexPath.row].id
            self.show(vc, sender: nil)
        }
    }
}
