//
//  CBSceneCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/22.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class CBSceneCell: UITableViewCell {

    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    func configTitle(title: String){
    
    
        nameLabel.text = title
    
    
    }
    
    
    
    class func createSceneCell(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withListModel listModel: CBRecommendWidgetListModel) -> CBSceneCell{
    
        
        let cellId = "sceneCellId"
    
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CBSceneCell
        
        
        if cell == nil {
        
        
            cell = NSBundle.mainBundle().loadNibNamed("CBSceneCell", owner: nil, options: nil).last as? CBSceneCell
        
        
        }
        
        
        if let title = listModel.title{
        
            
            cell?.configTitle(title)
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
