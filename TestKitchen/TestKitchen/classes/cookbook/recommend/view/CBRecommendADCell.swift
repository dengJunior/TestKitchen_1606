//
//  CBRecommendADCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/17.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class CBRecommendADCell: UITableViewCell, UIScrollViewDelegate{
    
    
    @IBOutlet weak var pageControl: UIPageControl!

    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    var bannerArray: Array<CBRecommendBannerModel>?{
        didSet{
            showData()
        }
    }
    
    
    
    func showData(){
    
        
        
        for sub in scrollView.subviews{
        
        
            sub.removeFromSuperview()
        
        
        }
        
        
        
        
        
        
        
        
        
        
        
        let cnt = bannerArray?.count
        if cnt>0{
        
            let containerView = UIView.createView()
            scrollView.addSubview(containerView)
            scrollView.pagingEnabled = true
            
            containerView.snp_makeConstraints(closure: {      [weak self]      (make) in
                make.edges.equalTo(self!.scrollView)
                make.height.equalTo(self!.scrollView)
                
            })
            
            
            
            var lastView: UIView? = nil
            for i in 0..<cnt! {
                
                let model = bannerArray![i]
                
                
                let tmpImageView = UIImageView.createImageView(nil)
                let url = NSURL(string: model.banner_picture!)
                let image = UIImage(named: "sdefaultImage")
                
                tmpImageView.kf_setImageWithURL(url, placeholderImage: image, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        
                containerView.addSubview(tmpImageView)
                
                
               tmpImageView.snp_makeConstraints(closure: { (make) in
                
                
                    make.top.bottom.equalTo(containerView)
                    make.width.equalTo(kScreenWidth)
                if i == 0{
                
                
                    make.left.equalTo(containerView)
                    
                    
                
                
                }else{
                
                    make.left.equalTo((lastView?.snp_right)!)
                
                
                }
                
                
                
               })
                
        
                lastView = tmpImageView
        
        
        
            }
    
            containerView.snp_makeConstraints(closure: { (make) in
                
                
                make.right.equalTo((lastView?.snp_right)!)
                
                
                
                
            })
            
            
            
            
            self.pageControl.numberOfPages = cnt!
            scrollView.delegate = self
            
            
            
            
            
            
            
            
        }
    
    
    
    
    }
    
    
    class func createADCellFor(tableView: UITableView, arIndexPath indexPath: NSIndexPath, withModel model: CBRecommendModel) -> CBRecommendADCell{
    
    
        
        let cellId = "recommendADCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CBRecommendADCell
        
        if cell == nil {
        
        
            cell = NSBundle.mainBundle().loadNibNamed("CBRecommendADCell", owner: nil, options: nil).last as? CBRecommendADCell
        
        
        }
    
    
        
        cell?.bannerArray = model.data?.banner
    
    
    
    
    
    
    
    
    
        return cell!
    
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}






extension CBRecommendADCell{



    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.size.width)
        
        
        pageControl.currentPage = index
        
        
        
        
        
    }












}