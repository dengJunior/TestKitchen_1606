//
//  KTCSegmentCtrl.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/23.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit



protocol  KTCSegmentCtrlDelegate : NSObjectProtocol {
    
    func didSelectSegCtrl(segCtrl: KTCSegmentCtrl, atIndex index: Int)
    
    
    
}



class KTCSegmentCtrl: UIView {
    
    
    weak var delegate: KTCSegmentCtrlDelegate?
    
    var selectedIndex: Int = 0{
        
        didSet{
            
            
            
            if selectedIndex != oldValue{
            
                selectedBtnAtIndex(selectedIndex, lastIndex:  oldValue)
                //系统自动传过来的
                //oldValue
            
            
            }
            
            
            
            
        }
        
    }
    

    private var lineView: UIView?
    
   init(frame: CGRect, titleNames: [String]) {
        super.init(frame: frame)
    
 
    
    
        
    if titleNames.count > 0 {
    
        
        
        let w = bounds.size.width/CGFloat(titleNames.count)
        
        
        for i in 0..<titleNames.count{
        
            let frame = CGRectMake(CGFloat(i)*w, 0, w, bounds.size.height)
            
            let btn = KTCSegmentBtn(frame: frame)
            
            
            btn.configTitle(titleNames[i])
            
            btn.tag = 300+i
            btn.addTarget(self, action: #selector(clickBtn(_:)), forControlEvents: .TouchUpInside)
            
            addSubview(btn)
            
            
            if i == 0{
            
            
                btn.clicked = true
            
            
            }
            
            
        }
        
        
    
    
        lineView = UIView.createView()
        
        lineView?.backgroundColor = UIColor.orangeColor()
        
        lineView?.frame = CGRectMake(0, bounds.size.height-4, w, 2)
    
        addSubview(lineView!)
        
        
        
        
        
        
    
    
    
    
    
    
    
    }
        
        
        
        
        
        
        
    
    
    
    }
    
    
    
    
    
    func clickBtn(btn:KTCSegmentBtn){
    
        
        if btn.tag != 300 + selectedIndex{
            
            
//            selectedBtnAtIndex(btn.tag - 300)
            selectedIndex = btn.tag - 300
            
            
            
            delegate?.didSelectSegCtrl(self, atIndex: selectedIndex)
            
        
        }
    
    }
    
    
    
    
    
    func selectedBtnAtIndex(index: Int, lastIndex: Int){
    
        print("你猜")
        
        let curBtn = viewWithTag(300+index)
        
        
        if curBtn?.isKindOfClass(KTCSegmentBtn.self) == true {
        
            let btn = curBtn as! KTCSegmentBtn
            
            btn.clicked = true
            
            
        }
        
        
        let lastBtn = viewWithTag(300 + lastIndex)

        
        if lastBtn?.isKindOfClass(KTCSegmentBtn.self) == true {
            
            
            let lastSegBtn = lastBtn as! KTCSegmentBtn
            
            
            
            lastSegBtn.clicked = false
            
            
            
            
        }
        
        
//        selectedIndex = index
        
        lineView?.frame.origin.x = (lineView?.bounds.size.width)! * CGFloat(selectedIndex)
        
        
    }
    
    
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
    


}





class KTCSegmentBtn: UIControl{



    private var label: UILabel?
    
   
    
    var clicked: Bool?{
    
        didSet{
        
        
            if clicked == true{
            
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