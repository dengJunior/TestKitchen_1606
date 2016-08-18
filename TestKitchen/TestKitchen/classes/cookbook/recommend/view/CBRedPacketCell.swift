//
//  CBRedPacketCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/18.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit



class CBRedPacketCell: UITableViewCell {

    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    var model: CBRecommendWidgetListModel?{
    
        
        didSet{
        
        
        
            showData()
        
        
        
        }
    
    
    
    
    }
    
    
    
    
    
    func showData(){
    
    
        let container = UIView.createView()
        
        
        scrollView.addSubview(container)
        
        scrollView.showsHorizontalScrollIndicator = false
        
        container.snp_makeConstraints {        [weak self]     (make) in
            
            
            
            make.edges.equalTo(self!.scrollView)
            
            make.height.equalTo(self!.scrollView.snp_height)
            
        }
    
    
        
        var lastView: UIView? = nil
        let cnt = model?.widget_data?.count
        if cnt>0{
            for i in 0..<cnt!{
            
                
                
                
                let imageModel = model?.widget_data![i]
                
                
                
                
                    if imageModel?.type == "image"{
                
                
                
                
                        let imageView = UIImageView.createImageView(nil)
                        
                        let url = NSURL(string: (imageModel?.content)!)
                        
                        imageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)

                        
                        
                        container.addSubview(imageView)
                
            
                        imageView.snp_makeConstraints(closure: { (make) in
                            
                            make.top.bottom.equalTo(container)
                            make.width.equalTo(180)
                            
                            
                            if i == 0{
                            
                            
                                make.left.equalTo(0)
                            
                            }else{
                            
                            
                                make.left.equalTo((lastView?.snp_right)!)
                            
                            }
                            
                            
                            
                            
                            
                            
                            
//                        MARK: ----
//                            lastView = imageView
                        })
                        
                        
           
                        
                        
                        imageView.userInteractionEnabled = true
                        imageView.tag = 400+i
                        
                        
                        let g = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
                        
                        imageView.addGestureRecognizer(g)
                        
                         lastView = imageView
            
                }
            
            
            
            
            }
        
            
            
            container.snp_makeConstraints(closure: { (make) in
                
                
                
                make.right.equalTo((lastView?.snp_right)!)
            })
            
            
        }
    
    
        
    
    
    }
    
    
    
    func tapAction(g: UIGestureRecognizer){
    
        let index = (g.view?.tag)! - 400
        
        print(index)
    
    
    }
    
    
    
    
    
    class func createRedPackageCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath , withListModel listModel: CBRecommendWidgetListModel ) -> CBRedPacketCell{
    
    
    
        let cellId = "redPacketCellId"
        
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CBRedPacketCell
        
        
        if nil == cell {
        
        
            cell = NSBundle.mainBundle().loadNibNamed("CBRedPacketCell", owner: nil, options: nil).last as? CBRedPacketCell
        
        }
    
    
    
    
    
        cell?.model = listModel
        
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

