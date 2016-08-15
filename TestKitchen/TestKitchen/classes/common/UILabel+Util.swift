//
//  UILabel+Util.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/15.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit



extension UILabel{


    class func createLabel(text: String?,font: UIFont?, textAligment: NSTextAlignment?, textColor: UIColor?) -> UILabel {
    
    
        let label = UILabel()
        
        if let labelText = text{
        
        
            label.text = labelText
        
        
        }
        
        
        
        
        if let labelFont = font{
        
            
            label.font = labelFont
        
        
        }
        
    
    
        
        if let labelAlign = textAligment{
        
        
        
            label.textAlignment = labelAlign
        
        
        }
        
        
        
    
        if let labelColor = textColor{
        
        
            label.textColor = labelColor
        
        }
    
        
        return label
    
    
    
    
    
    }










}