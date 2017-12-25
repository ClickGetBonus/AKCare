//
//  AKHelper.swift
//  AKCare
//
//  Created by Aki on 2017/11/28.
//  Copyright © 2017年 Ian. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import DGElasticPullToRefresh

extension UIImageView {
    func ak_setImage(urlString: String) {
        
        //因为web端返回图片路劲有前缀 "/.."
        var path = urlString
        if urlString.hasPrefix("/..") {
            path = urlString.subString(start: 3, length: urlString.characters.count-3)
        }
        let url = URL(string: AKServicePicPath + path)
        self.kf.setImage(with: url)
    }
}

extension UITableView {
    
    func setupRefreshable(color: UIColor, handler: @escaping () -> Void) {
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.white
        self.dg_addPullToRefreshWithActionHandler(handler, loadingView: loadingView)
        self.dg_setPullToRefreshFillColor(color)
        self.dg_setPullToRefreshBackgroundColor(self.backgroundColor!)
    }
    
    func finishRefresh() {
        self.dg_stopLoading()
    }
}

extension UICollectionView {
    
    func setupRefreshable(color: UIColor, handler: @escaping () -> Void) {
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.white
        self.dg_addPullToRefreshWithActionHandler(handler, loadingView: loadingView)
        self.dg_setPullToRefreshFillColor(color)
        self.dg_setPullToRefreshBackgroundColor(self.backgroundColor!)
    }
    
    func finishRefresh() {
        self.dg_stopLoading()
    }
}
