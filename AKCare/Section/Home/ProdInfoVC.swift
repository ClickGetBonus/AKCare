//
//  ProdInfoVC.swift
//  AKCare
//
//  Created by Aki on 2017/12/27.
//  Copyright © 2017年 Ian. All rights reserved.
//

import UIKit
import PKHUD

class ProdInfoVC: UIViewController {
    
    var product: Product!
    var favIsChangeBehavior: ((Bool) -> Void)?
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var prodImageView: UIImageView!
    @IBOutlet weak var prodNameLabel: UILabel!
    @IBOutlet weak var prodDimsLabel: UILabel!
    @IBOutlet weak var prodPlasterLayerLabel: UILabel!
    @IBOutlet weak var prodPromBaseLabel: UILabel!
    @IBOutlet weak var prodPaintSizeLabel: UILabel!
    @IBOutlet weak var prodDescLabel: UILabel!
    
    @IBOutlet weak var favImageView: UIImageView!
    @IBOutlet weak var favLabel: UILabel!
    
    var beforeFav: Bool = false //记录原本收藏状态, 用于返回时判断是否需要刷新列表
    var isFav: Bool = false
    
    var info: ProdInfoResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        }
        
        self.getProdInfo(prodId: self.product.prodId) { [unowned self] (response) in
            if let response = response {
                self.info = response
                self.beforeFav = response.favorite
                self.reloadData()
            }
        }
        self.setupBackItem()
    }
    
    func reloadData() {
        guard let info = self.info else {
            return
        }
        
        if let urlString = info.pics.first {
            self.prodImageView.ak_setImage(urlString: urlString)
        }
        self.prodNameLabel.text = info.name
        self.prodDimsLabel.text = info.prodDims
        self.prodPlasterLayerLabel.text = info.plasterLayer
        self.prodPromBaseLabel.text = info.promBaseProd
        
//        self.prodDescLabel.text = "1.可用刷涂、滚涂或喷涂方法来上漆。通常需涂两遍，正常情况下每遍间隔至少2小时待干透。 \n 2.本产品无需稀释，如必须稀释，可加入不超过5％的清水。切勿过度稀释，否则会导致起粉。\n3.具体请参照Akzo Nobel的施工指南\n1.可用刷涂、滚涂或喷涂方法来上漆。通常需涂两遍，正常情况下每遍间隔至少2小时待干透。 \n 2.本产品无需稀释，如必须稀释，可加入不超过5％的清水。切勿过度稀释，否则会导致起粉。\n3.具体请参照Akzo Nobel的施工指南\n1.可用刷涂、滚涂或喷涂方法来上漆。通常需涂两遍，正常情况下每遍间隔至少2小时待干透。 \n 2.本产品无需稀释，如必须稀释，可加入不超过5％的清水。切勿过度稀释，否则会导致起粉。\n3.具体请参照Akzo Nobel的施工指南\n1.可用刷涂、滚涂或喷涂方法来上漆。通常需涂两遍，正常情况下每遍间隔至少2小时待干透。 \n 2.本产品无需稀释，如必须稀释，可加入不超过5％的清水。切勿过度稀释，否则会导致起粉。\n3.具体请参照Akzo Nobel的施工指南"
        self.prodDescLabel.text = info.picTexts.reduce("", {$0+$1.content+"\n"})
        self.isFav = info.favorite
        
        self.updateFav()
    }
    
    
    func updateFav() {
        let imageName = self.isFav ? "fav_s" : "fav_d"
        let textColor = self.isFav ? UIColor.orange : UIColor.lightGray
        
        self.favImageView.image = UIImage(named: imageName)
        self.favLabel.textColor = textColor
    }
    
    @IBAction func onFav(_ sender: UIButton) {
        
        
        self.requestFav(prodId: self.product.prodId,
                        state: self.isFav ? ProdFavState.none : ProdFavState.have) { [unowned self] (response) in
                            
                            if response != nil {
                                self.isFav = !self.isFav
                                self.updateFav()
                                
                                if self.isFav {
                                    HUD.flash(.label("收藏成功"), delay: HUDPresentTimeInterval)
                                } else {
                                    HUD.flash(.label("取消收藏成功"), delay: HUDPresentTimeInterval)
                                }
                                
                                //更新上一页面列表信息
                                if self.favIsChangeBehavior != nil {
                                    self.favIsChangeBehavior!(self.beforeFav != self.isFav)
                                }
                            }
        }
    }
}


// MARK - Network
extension ProdInfoVC {
    
    func getProdInfo(prodId: String, handler: @escaping (ProdInfoResponse?) -> Void) {
        
        AKApi.send(request: ProdInfoRequest(sid: AKUserManager.getSid(),
                                            prodId: prodId),
                   handler)
    }
    
    func requestFav(prodId: String, state: ProdFavState, handler: @escaping (BaseResponse?) -> Void) {
        
        AKApi.send(request: ProdFavChangeRequest(sid: AKUserManager.getSid(),
                                                 prodId: prodId,
                                                 fav: state),
                   handler)
    }
}
