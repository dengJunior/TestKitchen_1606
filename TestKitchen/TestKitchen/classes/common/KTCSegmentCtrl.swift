//
//  KTCSegmentCtrl.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/23.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class KTCSegmentCtrl: UIView {
    
    var selectedIndex: Int = 0
    

    
   init(frame: CGRect, titleNames: [String]) {
        super.init(frame: frame)
    
 
    
    
        
    if titleNames.count > 0 {
    
        
        
        let w = bounds.size.width/CGFloat(titleNames.count)
        
        
        for i in 0..<titleNames.count{
        
            let frame = CGRectMake(CGFloat(i)*w, 0, w, bounds.size.height)
            
            let btn = KTCSegmentBtn(frame: frame)
            
            
            btn.configTitle(titleNames[i])
            
            btn.tag = 300+i
            btn.addTarget(self, action: #selector(clickBtn), forControlEvents: .TouchUpInside)
            
            addSubview(btn)
            
            
            if i == 0{
            
            
                btn.clicked = true
            
            
            }
            
            
        }
        
        
    
    
    
    
    
    
    
    
    
    
    }
        
        
        
        
        
        
        
    
    
    
    }
    
    
    
    
    
    func clickBtn(btn:KTCSegmentBtn){
    
        
        if btn.tag != 300 + selectedIndex{
        
        
        
        
        
        
        btn.selected = true
        
        
        
        let lastBtn = viewWithTag(300 + selectedIndex)
        
        
        if lastBtn?.isKindOfClass(KTCSegmentBtn.self) == true {
        
            
            let lastSegBtn = lastBtn as! KTCSegmentBtn
            
            
            
            lastSegBtn.clicked = false
        
        
        
        
        }
        
        
    
    
    
    
    
    
    
        selectedIndex = btn.tag - 300

    
        }
    
    }
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}





class KTCSegmentBtn: UIControl{



    private var label: UILabel?
    
   
    
    var clicked: Bool?{
    
        didSet{
        
        
            if clicked == false{
            
                label?.textColor = UIColor.blackColor()
            
            
            }else if clicked == false{
            
                
                label?.textColor = UIColor.grayColor()
            
            
            }
            
        
            
        
        
        }
    
    
    
    
    
    
    
    }
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        label = UILabel.createLabel(nil, font: UIFont.systemFontOfSize(20), textAligment: .Center, textColor: UIColor.grayColor())
//        label?.frame = self.bounds
        label?.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height-10)
        addSubview(label!)
        
        
        
        
    }
    
    
    func configTitle(title: String){
    
    
    
        label?.text = title
    
    
    
    }
    
    
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    














}