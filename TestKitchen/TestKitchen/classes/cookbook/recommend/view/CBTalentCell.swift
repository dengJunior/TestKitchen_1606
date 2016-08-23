//
//  CBTalentCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/22.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class CBTalentCell: UITableViewCell {

    
    
    @IBOutlet weak var talentImageView: UIImageView!
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    @IBOutlet weak var descLabel: UILabel!
    
    
    
    
    @IBOutlet weak var fansLabel: UILabel!
    
    

    var dataArray: Array<CBRecommendWidgeDataModel>?{
    
        didSet{
        
        
            showData()
        
        
        }
    
    
    
    
    }
    
    
    
    func showData(){
    
        
        if dataArray?.count > 0{
        
            let imageModel = dataArray![0]
            
            if imageModel.type == "image"{
            
            
                let url = NSURL(string: imageModel.content!)
                
                talentImageView.kf_setImageWithURL(url!, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                
            
            
            }
            
            
            
            
            if dataArray?.count > 1 {
            
            
                let nameModel = dataArray![1]
                
                
                if nameModel.type == "text"{
                
                
                
                
                    nameLabel.text = nameModel.content
                
                }
                
            
            
            
            
            }
            
            
            
            
            
            if dataArray?.count > 2{
            
                let descModel = dataArray![2]
                
                if descModel.type == "text"{
                
                
                    descLabel.text = descModel.content
                
                
                }
            
            
            
            }
            
            
            if dataArray?.count > 3 {
            
            
                let fansModel = dataArray![3]
                
                
                if fansModel.type == "text"{
                
                
                    fansLabel.text = fansModel.content
                
                
                }
            
            
            
            
            
            
            }
        
        
        
        
        }
        
    }
    
    
    class func createTalentCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withListModel listModel: CBRecommendWidgetListModel) -> CBTalentCell {
   
        
        let cellId = "talentCellId"
    
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CBTalentCell
        
        if nil == cell{
        
        
        
            cell = NSBundle.mainBundle().loadNibNamed("CBTalentCell", owner: nil, options: nil).last as? CBTalentCell
        }
    
        
        
        
        
        
        if listModel.widget_data?.count >= indexPath.row*4+4{
        
    
        let array = NSArray(array: listModel.widget_data!)
        let curArray = array.subarrayWithRange(NSMakeRange(indexPath.row*4, 4))
    
        cell?.dataArray = curArray as? Array<CBRecommendWidgeDataModel>
    
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
