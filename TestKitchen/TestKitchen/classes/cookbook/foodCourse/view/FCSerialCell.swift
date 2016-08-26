//
//  FCSerialCell.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/26.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit



protocol FCSerialCellDelegate: NSObjectProtocol {
    
    
    func didSelectSerialAtIndex(index: Int)
    
    
    
    func changeExpandState(isExpand: Bool)
    
    
    
}



class FCSerialCell: UITableViewCell {
    
    
    weak var delegate: FCSerialCellDelegate?
    
    
    private var moreBtn: UIButton?
    
    
    
    var isExpand: Bool = false
    
    
    
    
    var selectIndex: Int = 0{
    
        didSet{
        
            selectButtonAtIndex(selectIndex, lastIndex: oldValue)
            
        }
        
    }
    
    var number: Int? {
    
        didSet{
        
            if number > 0{
            
            
                showData()
            
            
            }
        
        }
    
    
    }
    
    
    
    private var btnW: CGFloat {
        
        
        get{
            
            return 40
            
            
        }
        
    }

    
    
    private var margin: CGFloat {
        
        
        get{
            
            return 20
            
            
        }
        
    }
    
    
    
    private var btnH: CGFloat {
        
        
        get{
            
            return 40
            
            
        }
        
    }
    
    
    
    private var spaceY: CGFloat {
        
        
        get{
            
            return 10
            
            
        }
        
    }
    
    
    
    private var rowNum: Int {
        
        
        get{
            
            return Int((kScreenWidth - margin*2)/btnW)
            
            
        }
        
    }
    
    
    
    
    private var spaceX: CGFloat {
        
        
        get{
            
            return (kScreenWidth - margin*2 - CGFloat(rowNum)*btnW)/CGFloat(rowNum - 1)
            
            
        }
        
    }
    
    
    private var moreBtnW: CGFloat {
    
        
        get {
        
        
        
            return 40
        
        
        
        }
    
    
    
    
    
    
    }
    
    
    
    
    
    
    //MARK:- func showData(){
    func showData(){
    
        
        
        for oldSub in contentView.subviews{
        
        
            oldSub.removeFromSuperview()
        
        
        }
        
        
        var cnt = number!
            
            
        if number! > rowNum*2 {
        
            
        
            if isExpand == false{
            
            
                cnt = rowNum * 2
            
            }
        
        
        
        
        
        }
    
//        let btnW: CGFloat = 40
    
//        let margin: CGFloat = 20
//        let btnH: CGFloat = 40
    
  
//        let spaceY: CGFloat = 10
        
        for i in 0..<cnt{
        
            let row = i/rowNum
            
            let col = i%rowNum
            
            let frame = CGRectMake(margin + (btnW+spaceX)*CGFloat(col), spaceY+(btnH+spaceY)*CGFloat(row), btnW, btnH)
        
            
            
            
            let btn = FCSerialBtn(frame: frame, index: i+1)
            btn.tag = 500+i
            btn.addTarget(self, action: #selector(clickBtn(_:)), forControlEvents: .TouchUpInside)
            
            
            contentView.addSubview(btn)
            
            
        }
        
    
        if number > rowNum * 2{
            
            
            
            var imageName = "pull.png"
            
            var btnRow = 2
            if isExpand == true{
                
             
                imageName = "push.png"
                
                btnRow = number!/rowNum
                
                if number!%rowNum > 0{
                
                    btnRow += 1
                
                
                }
                
                
                
                
                
            }
            
            
        
            moreBtn = UIButton.createBtn(nil, bgImageName: imageName, selectBgImageName: nil, target: self, action: #selector(expandAction))
            
            moreBtn?.frame = CGRectMake((kScreenWidth - moreBtnW )/2, margin + (btnH + spaceY)*CGFloat(btnRow), moreBtnW, moreBtnW)
        
        
            contentView.addSubview(moreBtn!)
        
        
        
        
        }
        
        
        
    }
    
    
    func expandAction(){
    
    
        
    
        delegate?.changeExpandState(!isExpand)
    
    
    
    
    
    
    
    
    
    
    }
    
    
    
    func selectButtonAtIndex(index: Int, lastIndex: Int) {
    
        
        
        
        let lastBtn = contentView.viewWithTag(500 + lastIndex)
        
        if lastBtn?.isKindOfClass(FCSerialBtn.self) == true {
        
        
            let btn = lastBtn as! FCSerialBtn
            btn.clicked = false
        
        
        
        }
        
        let curBtn = contentView.viewWithTag(500+index)
        
        if curBtn?.isKindOfClass(FCSerialBtn.self) == true {
            
            
            
            let btn = curBtn as! FCSerialBtn
            
            
            btn.clicked = true
        }
    
    
    
    }
    
    
    
    
    
    
    func clickBtn(btn: FCSerialBtn){
        
        selectIndex = btn.tag - 500
        
        delegate?.didSelectSerialAtIndex(selectIndex)
        
    }
    
    
    
  
    
    
    class func heightWithNum(num: Int, isExpand: Bool) -> CGFloat {
    
        let cell = FCSerialCell()
        
        var rows = num/cell.rowNum
        
        if num%cell.rowNum > 0{
            
         rows += 1
            
            
        }
    
        
        if (num > cell.rowNum*2) && (isExpand == false){
        
        
            rows = 2
        
        
        }
        
    
        
        var h = cell.margin + CGFloat(rows)*(cell.btnH+cell.spaceY) + cell.margin
        if num > cell.rowNum * 2{
        
        
        
            h += (cell.moreBtnW + cell.margin)
        
        
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






class FCSerialBtn: UIControl{


    var titleLabel: UILabel?
    
    
    
    var clicked: Bool?{
    
    
        didSet{
        
        
            if clicked == true{
                backgroundColor = UIColor.orangeColor()
            
            
                titleLabel?.textColor = UIColor.whiteColor()
            
            
            
            }else if clicked == false{
                backgroundColor = UIColor.lightGrayColor()
                
                titleLabel?.textColor = UIColor.grayColor()
                
            }
            
        }
    }
    
    
    
    init(frame: CGRect, index: Int) {
        super.init(frame: frame)
        
        
        
        titleLabel = UILabel.createLabel("\(index)", font: UIFont.systemFontOfSize(12), textAligment: .Center, textColor: UIColor.blackColor())
        titleLabel?.frame = self.bounds
        
        addSubview(titleLabel!)
        
        
        backgroundColor = UIColor.init(white: 0.8, alpha: 1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }














}
