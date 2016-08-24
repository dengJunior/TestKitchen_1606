//
//  CBMaterialCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/24.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class CBMaterialCell: UITableViewCell {
    
    
    
    
    
    
    var model:  CBMaterialTypeModel?{
    
        didSet{
        
            if model != nil {
            showData()
            }
        
        }
    
        
    }
    
    
    
    func showData(){
    
        
        for oldSub in contentView.subviews{
            oldSub.removeFromSuperview()
        }
    
        
        let titleLabel = UILabel.createLabel(model!.text, font: UIFont.systemFontOfSize(20), textAligment: NSTextAlignment.Left , textColor: UIColor.blackColor())
        titleLabel.frame = CGRectMake(20, 0, kScreenWidth - 20*2, 40)
        contentView.addSubview(titleLabel)
        
        
        
    
        let spaceX: CGFloat = 20
        let spaceY: CGFloat = 10
        let colNum = 5
        let h: CGFloat = 40
        let w = (kScreenWidth - CGFloat(colNum + 1)*spaceX)/CGFloat(colNum)
    
        let offsetY: CGFloat = 40
        
        
        
        let imageFrame = CGRectMake(spaceX, offsetY, (w*2+spaceX), (h*2+spaceY))
        let imageView = UIImageView.createImageView(nil)
        imageView.frame = imageFrame
        let url = NSURL(string: (model?.image)!)
        imageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        contentView.addSubview(imageView)
        
    
        if model?.data?.count>0{
            for i in 0..<(model?.data?.count)!{
            
                var btnFrame = CGRectZero
                if i < 6 {
                
                
                    let row = CGFloat(i/3)
                    let col = CGFloat(i%3)
                    
                    btnFrame = CGRectMake(w*2+spaceX*3+(w+spaceX)*col, offsetY+(h+spaceY)*row, w, h)
                    
                }else{
                
                    
                    let row = CGFloat((i - 6)/5+2)
                    let col = CGFloat((i-6)%5)
                    
                    btnFrame = CGRectMake(spaceX+col*(w+spaceX), offsetY+(h+spaceY)*row, w, h)
                    
                    
                    
                    
                }
                
                
                let btn = CBMaterialBtn(frame: btnFrame)
                
                let subModel = model?.data![i]
                
                btn.model = subModel
                
                contentView.addSubview(btn)
            
                
            
            
            
            
            
            }
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
    
    
    
    
    
    
    
    
    
    
    class func heightWithModel(model: CBMaterialTypeModel) -> CGFloat{
    
        
        var h: CGFloat = 0
    
        
        let offsetY: CGFloat = 40
        let spaceY: CGFloat = 10
        let btnH: CGFloat = 40
        
        
        if model.data?.count > 0{
        
            if model.data?.count <= 6{
                h = offsetY + (btnH+spaceY)*2
                
                
            }else{
            
            
                h = offsetY + (btnH+spaceY)*2
            
                var rowNum = ((model.data?.count)!-6)/5
                
                if ((model.data?.count)! - 6)/5 > 0 {
                
                    rowNum += 1
                
                }
                
                
                
                h += CGFloat(rowNum)*(btnH + spaceY)
                
                
                
                
            
            
            
            }
        
        }
    
    
    
    
    
    
    
    
    
    
        return h
    
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



class CBMaterialBtn: UIControl{

    
    private var titleLabel: UILabel?
    
    var model: CBMaterialSubtypeModel?{
    
        didSet{
            
            titleLabel?.text = model?.text
        }
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        backgroundColor = UIColor.lightGrayColor()
        backgroundColor = UIColor(white: 0.6, alpha: 0.8)
        
        titleLabel = UILabel.createLabel(nil, font: UIFont.systemFontOfSize(17), textAligment: .Center, textColor: UIColor.blackColor())
        
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.frame = bounds
        addSubview(titleLabel!)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }









}
