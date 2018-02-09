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
            
            tableView.setupRefreshable(color: NavBGTranslucentColor) {
                self.delay(seconds: HUDPresentTimeInterval, completion: {
                    self.tableView.dg_stopLoading()
                })
            }
        }
    }
    
    var proms: [PromBanner] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SwiftLoader.show(animated: true)
        AKApi.send(request: HomePageRequest(sid: AKUserManager.getSid())) { (response) in
            
            if let proms = response?.proms {
                self.proms = proms
                self.updateViews()
            }
            SwiftLoader.hide()
        }
        
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func updateViews() {
        
        self.tableView.reloadData()
    }
    
}

extension PromotionVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return proms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProBannerCell = tableView.dequeueReusableCell(withIdentifier: ProBannerCell.className) as! ProBannerCell
        cell.bannerImageView.ak_setImage(urlString: proms[indexPath.row].pic)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let banner = proms[indexPath.row]
        
        let vc = R.storyboard.promotion.proInfoVC()!
        vc.configure(banner: banner)
        self.show(vc, sender: nil)
    }
}
