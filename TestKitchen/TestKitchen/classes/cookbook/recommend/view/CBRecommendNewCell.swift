//
//  CBRecommendNewCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/19.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class CBRecommendNewCell: UITableViewCell{

    
    var model: CBRecommendWidgetListModel?{
    
        
        didSet{
        
            
            showData()
        }
    
        
    }
    
    
    
    
    
    func showData(){
    
        
        for i in 0..<3{
            
            if model?.widget_data?.count > i*4{
            
                let imageModel = model?.widget_data![i*4]
            
                if imageModel?.type == "image" {
                    let url = NSURL(string: (imageModel?.content)!)
                    let dImage = UIImage(named: "sdefaultImage")
                    
                    let subView = contentView.viewWithTag(200+i)
                    if subView?.isKindOfClass(UIImageView.self) == true {
                    
                        let imageView = subView as! UIImageView
                    
                        imageView.kf_setImageWithURL(url, placeholderImage: dImage, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                        
                    }
                }
                
            }
            
            //
            if model?.widget_data?.count > i*4+2{
                
                let titleModel = model?.widget_data![i*4+2]
                
                if titleModel?.type == "text"{
                    
                    
                    let subView = contentView.viewWithTag(400+i)
                    
                    
                    if subView?.isKindOfClass(UILabel.self) == true{
                        
                        
                        
                        
                        let titleLabel = subView as! UILabel
                        
                        titleLabel.text = titleModel?.content
                        
                        
                    }
                    
                    
                    
                }
                
                
            }
            
            
            //
            
            
            
            if model?.widget_data?.count > i*4+3{
                
                let descModel = model?.widget_data![i*4+3]
                if descModel?.type == "text"{
                    
                    let subView = contentView.viewWithTag(500+i)
                    
                    if subView?.isKindOfClass(UILabel.self) == true{
                        
                        let descLabel = subView as! UILabel
                        descLabel.text = descModel?.content
                        
                    }
                }
               
            }
            ///

        }
    }
    
    
    
    
    
    class func createNewCellForTableView(tableView: UITableView, atIndexPath indexPath: NSIndexPath , wirhListModel listModel: CBRecommendWidgetListModel) -> CBRecommendNewCell{
    
    
        //recommendNewCellId
   
        let cellId = "recommendNewCellId"
    
    
    
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as?CBRecommendNewCell
    
    
        if nil == cell {
        
            cell = NSBundle.mainBundle().loadNibNamed("CBRecommendNewCell", owner: nil, options: nil).last as? CBRecommendNewCell
            
        
        }
    
        
            cell?.model = listModel
    
        
            return cell!
    
    
     }
    
    
    
    
    @IBAction func clickBtn(sender: AnyObject) {
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    @IBAction func playAction(sender: UIButton) {
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
