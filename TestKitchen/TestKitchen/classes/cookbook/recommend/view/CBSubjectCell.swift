//
//  CBSubjectCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/23.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class CBSubjectCell: UITableViewCell {

    
    @IBOutlet weak var subjectImageView: UIImageView!
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    
    
    @IBOutlet weak var descLabel: UILabel!
    
    
    
    
    
    var dataArray: Array<CBRecommendWidgeDataModel>?{
    
//    var dataArray: [CBRecommendWidgeDataModel]?{
        didSet{
        
            showData()
        
        
        
        }
        
    }
    
    
    
    
    func showData(){
        
        
        
        if dataArray!.count>0{
            
        
            let imageModel = dataArray![0]
            if imageModel.type == "image"{
            
            
                let url = NSURL(string: (imageModel.content)!)
            
            
                subjectImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: ""), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
            
                
            
            }
            
        
        
        }
        
        
        if dataArray!.count>1{
        
        let titleModel = dataArray![1]
            if titleModel.type == "text"{
            
            
                titleLabel.text = titleModel.content
            
            
            }
        
        
        }
        
        
        
        if dataArray!.count>2{
            
            let descModel = dataArray![2]
            if descModel.type == "text"{
                
                
                descLabel.text = descModel.content
                
                
            }
            
            
        }
        
        
        
        
        
        
        
    
    }
    
    
    
    
    
    
    
    
    
    
    class func  createSubjectCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withListModel listModel: CBRecommendWidgetListModel) -> CBSubjectCell {
    
    
        let cellId = "subjectCEllId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CBSubjectCell

        
        
        if nil == cell{
        
            cell = NSBundle.mainBundle().loadNibNamed("CBSubjectCell", owner: nil, options: nil).last as? CBSubjectCell
        
        
        }
    
    
        if listModel.widget_data?.count > indexPath.row*3+2{
    
        let array = NSArray(array: listModel.widget_data!)
        
        cell?.dataArray = array.subarrayWithRange(NSMakeRange(indexPath.row*3, 3)) as? Array<CBRecommendWidgeDataModel>

        }
        
        
        
        
        
    
    
    
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
