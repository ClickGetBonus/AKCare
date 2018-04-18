//
//  ProInfoVC.swift
//  AKCare
//
//  Created by Aki on 2017/12/1.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit

class ProInfoVC: UIViewController {
    
    @IBOutlet weak var proImgView: UIImageView!
    @IBOutlet weak var proIntroLabel: UILabel!
    @IBOutlet weak var joinButtonView: UIView!
    
    @IBOutlet weak var proImageTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var proImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var joinButtonHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.proImageWidthConstraint.constant = ScreenWidth
        self.setupBackItem()
    }
    
    func configure(banner: PromBanner) {
        
        self.title = "活动详情"
        
        SwiftLoader.show(animated: true)
        AKApi.send(request: PromInfoRequest(sid: AKUserManager.getSid(), actId: banner.id, actType: banner.actType)) { (response) in
            
            if let prom = response {
                
                self.joinButtonView.isHidden = !prom.actStarted
                let imgType = prom.picTexts.filter{return $0.imgType}.first
                
                if imgType != nil {
                    self.proImgView.ak_setImage(urlString: imgType!.content)
                }
                
                let intro = prom.picTexts.reduce("", { (result, element) -> String in
                    return element.imgType ? result : result + element.content + "\n"
                })
                self.proIntroLabel.text = intro
            }
            
            SwiftLoader.hide()
        }
    }
    
    @IBAction func onJoin(_ sender: UIButton) {
        
    }
}

extension ProInfoVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.proImageWidthConstraint.constant = ScreenWidth - min(0, scrollView.contentOffset.y)
        self.proImageTopConstraint.constant = min(0, scrollView.contentOffset.y)
    }
}
