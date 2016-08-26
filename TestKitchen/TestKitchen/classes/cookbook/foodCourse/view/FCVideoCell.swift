//
//  FCVideoCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/25.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class FCVideoCell: UITableViewCell {

    
    var videoClosure: (String -> Void)?
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var model: FoodCourseSerialModel?{
    
        didSet{
        
            if model != nil{
        
            showData()
        
            }
        
        
        
        }
    
        
        
    
    
    
    }
    
    
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    
    
    
    
    
    @IBAction func playVideo(sender: UIButton) {
        
        
        self.videoClosure!((model?.course_video)!)
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    func showData(){
    
        
    
        let url = NSURL(string: (model?.course_image)!)
        
        
        
        self.bgImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        
        

        if model?.video_watchcount != nil  {
        
        
        titleLabel.text = "\((model?.video_watchcount)!) 人 做过"
    
        }
    
    
    
    
    
    
    
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
