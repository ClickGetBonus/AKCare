//
//  MessageVC.swift
//  AKCare
//
//  Created by Aki on 2017/10/31.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class InfomationVC: UIViewController {
    
    let padding: CGFloat = 12.0
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            
            collectionView.register(MsgTypeCell.nib, forCellWithReuseIdentifier: MsgTypeCell.className)
            collectionView.alwaysBounceVertical = true
            
            let collectionLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            let sizeWidth = (ScreenWidth-3*self.padding)/2
            collectionLayout.itemSize = CGSize(width: sizeWidth, height: 310/358*sizeWidth)
            collectionLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: 0, right: padding)
            collectionView.collectionViewLayout = collectionLayout
            
            self.collectionView.setupRefreshable(color: NavBGTranslucentColor) { [weak self] () -> Void in
                
                self?.updateTypes{
                    self?.collectionView.finishRefresh()
                }
            }
        }
    }
    
    var messages: [UIImage] = []
    
    let CellIdentifier: String = MsgTypeCell.className
    var types: [InfoType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.collectionView.isHidden = true
        SwiftLoader.show(animated: true)
        self.updateTypes{
            self.setupSubviews()
            SwiftLoader.hide()
            self.collectionView.isHidden = false
        }
    }
    
    func setupSubviews() {
        
    }
    
    func updateTypes(_ complete: @escaping () -> Void) {
        
        AKApi.getMsgType { (response) in
            
            if let types = response?.types {
                self.types = types
            }
            self.collectionView.reloadData()
            self.collectionView.finishRefresh()
            complete()
        }
    }
}

extension InfomationVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return types.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MsgTypeCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! MsgTypeCell
        cell.imageView.image = #imageLiteral(resourceName: "bar_wait_act")
        cell.imageView.ak_setImage(urlString: self.types[indexPath.row].pic)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
