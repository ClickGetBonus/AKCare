//
//  PromotionVC.swift
//  AKCare
//
//  Created by Aki on 2017/10/31.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit
import DGElasticPullToRefresh

class PromotionVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(ProBannerCell.nib, forCellReuseIdentifier: ProBannerCell.className)
            
            let loadingView = DGElasticPullToRefreshLoadingViewCircle()
            loadingView.tintColor = UIColor.white
            tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
                
                self?.delay(seconds: HUDPresentTimeInterval, completion: {
                    self?.tableView.dg_stopLoading()
                })
                
                }, loadingView: loadingView)
            tableView.dg_setPullToRefreshFillColor(NavBGColor)
            tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
        }
    }
    
    var banners: [UIImage] = [#imageLiteral(resourceName: "pro_banner1"), #imageLiteral(resourceName: "pro_banner2"), #imageLiteral(resourceName: "pro_banner1"), #imageLiteral(resourceName: "pro_banner2"), #imageLiteral(resourceName: "pro_banner1"), #imageLiteral(resourceName: "pro_banner2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = NavBGColor
    }

}

extension PromotionVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banners.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProBannerCell = tableView.dequeueReusableCell(withIdentifier: ProBannerCell.className) as! ProBannerCell
        cell.bannerImageView.image = banners[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
