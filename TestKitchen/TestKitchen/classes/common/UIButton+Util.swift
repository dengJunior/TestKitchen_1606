//
//  UIButton+Util.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/15.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit



extension UIButton{


    
    
    class func createBtn(title: String?, bgImageName: String?, selectBgImageName: String?, target: AnyObject?, action: Selector) -> UIButton {
        
        
        
        let btn = UIButton(type: .Custom)
        
        
        
        if let btnTitle = title{
        
        
            btn.setTitle(btnTitle, forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        
        
        }
    
    
    
    
        if let btnBgImageName = bgImageName{
        
            btn.setBackgroundImage(UIImage(named: bgImageName!), forState: .Normal)
        
            
        
        
        }
        
        
        
        if let btnSelectedBgImageName = selectBgImageName {
            
            
            btn.setBackgroundImage(UIImage(named: btnSelectedBgImageName), forState: .Selected)
            
            
        }
    
    
        
        
        if let btnTarget = target {
        
            
           btn.addTarget(btnTarget, action: action, forControlEvents: .TouchUpInside)
            
        
        
        
        
        }
    
    
    
    
    
    
        return btn
    
    
    }













}
