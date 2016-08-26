//
//  FCCourceCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/26.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class FCCourceCell: UITableViewCell {

    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    
    @IBOutlet weak var subjectLabel: UILabel!
    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    
    var model: FoodCourseSerialModel?{
    
        didSet{
        
        
            showData()
        
        }
    
    
    }
    
    
    
    
    func showData(){
    
        nameLabel.text = model?.course_name
        
        if model?.course_subject != nil {
        
        subjectLabel.text = model?.course_subject
        
        
        
    
        let dict = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
        
            let h = NSString(string: (model?.course_subject)!).boundingRectWithSize(CGSizeMake(kScreenWidth - 20*2, CGFloat.max), options: .UsesLineFragmentOrigin, attributes: dict, context: nil).size.height
    
    
    
            heightConstraint.constant = CGFloat(Int(h) + 1)
            
            
    
        }
    
    }
    
    
    
    
    class func heightWithModel(model: FoodCourseSerialModel) -> CGFloat{
        let titleH: CGFloat = 20
        let marginY: CGFloat = 10
        let dict = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
        var height: CGFloat = marginY + titleH + marginY
        if model.course_subject != nil {
            let h = NSString(string: model.course_subject!).boundingRectWithSize(CGSizeMake(kScreenWidth - 20*2, CGFloat.max), options: .UsesLineFragmentOrigin, attributes: dict, context: nil).size.height
            let newHeight = CGFloat(Int(h) + 1)
            height += (newHeight + marginY)
        }
        return height
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
