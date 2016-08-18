//
//  CBSearchHeaderView.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/18.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class CBSearchHeaderView: UIView {

    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        let searchBar = UISearchBar(frame: CGRectMake(40,0,bounds.size.width-40*2,bounds.size.height));
//        searchBar.barStyle = .Default
//        searchBar.barTintColor = UIColor.whiteColor()
        searchBar.placeholder = "输入菜名 或 食材 ，搜索"
        searchBar.alpha = 0.5
        searchBar.setPositionAdjustment(UIOffset(horizontal: 40, vertical: 4), forSearchBarIcon: UISearchBarIcon.Search)
        addSubview(searchBar)
        
        
        
//        let textField = UITextField(frame: CGRectMake(40,4,bounds.size.width - 40*2,bounds.size.height - 4*2))
//        
//        
//        textField.borderStyle = .RoundedRect
//        
//        textField.placeholder = "输入 菜名 或 食材 搜索"
//        addSubview(textField)
//        
//        
//        
        backgroundColor = UIColor(white: 0.8, alpha: 1.0)
//
//        let imgView = UIImageView.createImageView("search")
//        imgView.frame = CGRectMake(0, 0, 30, 30)
//        textField.leftView = imgView
//        
//        textField.leftViewMode = .Always
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
