//
//  FCCommentCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/26.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class FCCommentCell: UITableViewCell {
    
    
 
    @IBOutlet weak var userImageView: UIImageView!
    
    
    
    @IBOutlet weak var reportButton: UIButton!
    
    
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    
    
    @IBOutlet weak var contentLabel: UILabel!
    
    
    
    
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    
    
    
    
    
    
    
    var model: FCCommentDetail? {
    
        didSet{
            
        if model != nil {
        
            showData()
        
            
            }
        }
    }
    
    
    
    
        func showData(){
        
        
            let url = NSURL(string: (model?.head_img)!)

            
            
            userImageView.layer.cornerRadius = 30
            
            userImageView.layer.masksToBounds = true
            
            
            userImageView.kf_setImageWithURL(url! , placeholderImage: UIImage(named: "sdefaultImage") , optionsInfo: nil, progressBlock: nil, completionHandler: nil)
            
            
            
            
            nameLabel.text = model?.nick
            contentLabel.text = model?.content
            timeLabel.text = model?.create_time
            
            
        
        
        
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
