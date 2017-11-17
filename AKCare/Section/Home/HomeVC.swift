//
//  HomeVC.swift
//  AKCare
//
//  Created by Aki on 2017/10/31.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit
import Gemini
import DGElasticPullToRefresh

class HomeVC: UITableViewController {

    @IBOutlet weak var proCollectView: GeminiCollectionView! {
        didSet {
            let nib = UINib(nibName: cellIdentifier, bundle: nil)
            proCollectView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
            proCollectView.gemini
                .scaleAnimation()
                .scale(0.75)
                .scaleEffect(scaleEffect)
                .ease(.easeOutQuart)
        }
    }
    
    fileprivate let cellIdentifier = "ImageCollectionViewCell"
    private(set) var scrollDirection: UICollectionViewScrollDirection = .horizontal
    private(set) var scaleEffect: GeminScaleEffect = .scaleUp
    
    fileprivate let images: [UIImage] = [#imageLiteral(resourceName: "pro_banner1"), #imageLiteral(resourceName: "pro_banner2"), #imageLiteral(resourceName: "pro_banner1"), #imageLiteral(resourceName: "pro_banner2"), #imageLiteral(resourceName: "pro_banner1"), #imageLiteral(resourceName: "pro_banner2"), #imageLiteral(resourceName: "pro_banner1"), #imageLiteral(resourceName: "pro_banner2")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let sid = AKUserManager.userAuth?.sid else {
            self.showInfo("登录已过期, 请重新登录")
            UIApplication.shared.keyWindow?.rootViewController = R.storyboard.login().instantiateInitialViewController()!
            return
        }
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = NavBGColor
        
        
        URLSessionClient.share.send(HomePageRequest(sid: sid)) { (response) in
            
            self.initSubviews()
            self.tableView.isHidden = false
        }
        
    }
    
    func initSubviews() {
        
        
        tableView.backgroundColor = UIColor.white
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        proCollectView.delegate   = self
        proCollectView.dataSource = self
        
        
        // Setting of UICollectionViewFlowLayout
        let layout = UICollectionViewPagingFlowLayout()
        layout.scrollDirection = scrollDirection
        let padding: CGFloat = 5.0
        let width = ScreenWidth - 2*padding
        layout.itemSize = CGSize(width: width, height: 230/750*width)
        layout.sectionInset = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        layout.minimumInteritemSpacing = padding/2
        layout.minimumLineSpacing = padding/2
        proCollectView.collectionViewLayout = layout
        proCollectView.decelerationRate = UIScrollViewDecelerationRateFast
        
        
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        loadingView.tintColor = UIColor.white
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: {
                self?.tableView.dg_stopLoading()
            })
            }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(NavBGColor)
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }
    
    
}


// MARK: - UIScrollViewDelegate
extension HomeVC {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.proCollectView.animateVisibleCells()
    }
}

// MARK: - UICollectionViewDelegate
extension HomeVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? GeminiCell {
            self.proCollectView.animateCell(cell)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ImageCollectionViewCell
        cell.configure(with: images[indexPath.row])
        self.proCollectView.animateCell(cell)
        return cell
    }
}

