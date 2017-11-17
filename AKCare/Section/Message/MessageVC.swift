//
//  MessageVC.swift
//  AKCare
//
//  Created by Aki on 2017/10/31.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class MessageVC: UIViewController {
    
    let padding: CGFloat = 12.0
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var messages: [UIImage] = []
    
    let CellIdentifier: String = MsgTypeCell.className
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.isHidden = true
        
        SwiftLoader.show(animated: true)
        delay(seconds: 2.0) {
            self.collectionView.register(MsgTypeCell.nib, forCellWithReuseIdentifier: self.CellIdentifier)
            self.collectionView.isHidden = false
            SwiftLoader.hide()
        }
    }
    
    func setupSubviews() {
        
        let layout = UICollectionViewFlowLayout()
        let width = ScreenWidth - padding/3
        layout.itemSize = CGSize(width: width, height: 310/358*width)
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        self.collectionView.collectionViewLayout = layout
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}

extension MessageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MsgTypeCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier, for: indexPath) as! MsgTypeCell
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
