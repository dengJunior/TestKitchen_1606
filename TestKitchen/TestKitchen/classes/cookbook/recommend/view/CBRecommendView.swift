//
//  CBRecommendView.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/17.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class CBRecommendView: UIView , UITableViewDelegate , UITableViewDataSource{

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    private var tbView: UITableView?
    
    
    var model :CBRecommendModel?{
    
        didSet{
        
            
            tbView?.reloadData()
        
        
        
        }
    
    
    
    
    
    }
    
    
    
    init(){
        super.init(frame: CGRectZero)
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        tbView?.separatorStyle = .None
        self.addSubview(tbView!)
        
        tbView?.snp_makeConstraints(closure: {     [weak self]         (make) in
            make.edges.equalTo(self!)
            })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    
}



//MARK:-    tableView
extension CBRecommendView{

    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowNum = 0
        
        if section == 0{
        
            if model?.data?.banner?.count>0{
            
                rowNum = 1
            
            }
        
        }
        
        
        
        
        return rowNum
    }




    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        
        
        if indexPath.section == 0{
        
            if model?.data?.banner?.count>0{
            
                height = 160
            
            }
            
        
        
        
        
        
        
        }
        
        
        
        
        
        return height
    }



    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0{
        
            if model?.data?.banner?.count > 0{
            
            
            
            
                cell = CBRecommendADCell.createADCellFor(tableView, arIndexPath: indexPath, withModel: model!)
            
            
            
            }
        
        
        
        }
        
        
        
        
        
        return cell
    }








}