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
    
    @IBOutlet weak var hotLeftButton: UIButton!
    @IBOutlet weak var hotRightTopButton: UIButton!
    @IBOutlet weak var hotRightBottomButton: UIButton!
    
    @IBOutlet weak var promLabelCurrent: UILabel!
    @IBOutlet weak var promLabelMax: UILabel!
    
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
    
    var response: HomePageResponse? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        SwiftLoader.show(animated: true)
        AKApi.send(request: HomePageRequest(sid: AKUserManager.getSid())) { (response) in
            
            if let prom = response?.proms {
                self.promLabelMax.text = "\(prom.count)"
            }
            self.response = response
            self.initSubviews()
            self.updateViews()
            SwiftLoader.hide()
        }
    }
    
    func initSubviews() {
        
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
        
        proCollectView.delegate   = self
        proCollectView.dataSource = self
        
        self.tableView.backgroundColor = UIColor.white
        self.tableView.setupRefreshable(color: NavBGTranslucentColor) { [weak self] () -> Void in
            AKApi.send(request: HomePageRequest(sid: AKUserManager.getSid())) { (response) in
                if let response = response {
                    self?.promLabelMax.text = "\(response.proms.count)"
                    self?.promLabelCurrent.text = "1"
                    self?.response = response
                    self?.proCollectView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
                }
                self?.updateViews()
                self?.tableView.finishRefresh()
            }
            
        }
    }
    
    @IBAction func onSign(_ sender: UIButton) {
        SignView.show(in: 3)
    }
    
    @IBAction func onProductType(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goProdType", sender: nil)
    }
    
    @IBAction func onSchool(_ sender: UIButton) {
    }
    
    func updateViews() {
        if let bannerLeft = self.response?.dynLeft {
            self.hotLeftButton.ak_setImage(urlString: bannerLeft.pic)
        }
        if let bannerRightTop = self.response?.dynRightTop {
            self.hotRightTopButton.ak_setImage(urlString: bannerRightTop.pic)
        }
        if let bannerRightBottom = self.response?.dynRightBtm {
            self.hotRightBottomButton.ak_setImage(urlString: bannerRightBottom.pic)
        }
        self.tableView.reloadData()
        self.proCollectView.reloadData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goProdType" {
            
//            let vc: ProdTypeVC = segue.destination as! ProdTypeVC
        }
    }
}

// MARK: - UIScrollViewDelegate
extension HomeVC {
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView === self.proCollectView {
            //更新当前选择活动下标
            let offsetX = scrollView.contentOffset.x
            guard offsetX > 0 else {
                return
            }
            let index = Int(offsetX/ScreenWidth) + (Int(offsetX)%Int(ScreenWidth) > Int(ScreenWidth/2) ? 1 : 0)
            self.promLabelCurrent.text = "\(index+1)"
        }
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
        return response?.proms.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ImageCollectionViewCell
//        cell.configure(with: images[indexPath.row])
        if let pic = self.response?.proms[indexPath.row].pic {
            cell.sampleImageView.ak_setImage(urlString: pic)
        }
        self.proCollectView.animateCell(cell)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let banner = response?.proms[indexPath.row] {
            
            let vc = R.storyboard.promotion.proInfoVC()!
            vc.configure(banner: banner)
            self.show(vc, sender: nil)
        }
    }
}

