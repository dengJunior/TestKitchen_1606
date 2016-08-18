//
//  MainTabBarController.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/15.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    private var bgView: UIView?
    
    private var array: Array<Dictionary<String,String>>?{
    
    
    
        get{
        
            let path = NSBundle.mainBundle().pathForResource("Ctrl.json", ofType: nil)
            
            
            var myArray: Array<Dictionary<String,String>>? = nil
            
            
            if let filePath = path{
            
                
             let data = NSData(contentsOfFile: filePath)
                
                
                
                
                
                if let jsonData = data{
                    
                    
//                    let data = NSData(contentsOfFile: filePath)
                    
                    
                    do {
                    
                    
                        let jsonValue = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers)
                    
                    
                        
                        if jsonValue.isKindOfClass(NSArray.self){
                        
                            myArray = jsonValue as? Array<Dictionary<String,String>>
                            }
                        
                        
                    
                    }catch{
                    
                    
                        print(error)
                    
                    
                        return nil
                    }
                    
                    
                    
                    
                }
                
            
        
                
            
        }
    
            return myArray
    
        
    
    
        }
    
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        createViewControllers()
        
        
        
        
    }

    
  
    
    
    
    
    
    
    
    
    
    
    
    func createViewControllers(){
    
    
        
        
        var ctrlNames = [String]()
    
        var imageNames = [String]()
        var titleNames = [String]()
     
        
        
        if let tmpArray = self.array{
        
        
            for dict in tmpArray{
            
            
                let name = dict["ctrlName"]
                ctrlNames.append(name!)
                
                let titleName = dict["titleName"]
                titleNames.append(titleName!)
                
                
                let imageName = dict["imageName"]
                imageNames.append(imageName!)
            
            
            
            }
        
        
            
        
        
        }else{
        
        
            //MARK:-        备用 选择
            ctrlNames = ["CookBookViewController","CommunityViewController","MallViewController","FoodClassViewController","ProfileViewController"]
        
            
            
            
            
            titleNames = ["食材","社区","商城","食课","我的"]
            imageNames = ["home","community","shop","shike","mine"]
            
        
        
        }
        
        
        
        
        
    var vCtrlArray = Array<UINavigationController>()
        for i in 0..<ctrlNames.count{
        
            let ctrlName = "TestKitchen." + ctrlNames[i]
        
            
            let cls = NSClassFromString(ctrlName) as! UIViewController.Type
            
            
            let ctrl = cls.init()
            
            
            let navCtrl = UINavigationController(rootViewController: ctrl)
        
        
        
            vCtrlArray.append(navCtrl)
        
        }
        
        
    
        self.viewControllers = vCtrlArray
    
        self.createCustomTabbar(titleNames, imageNames: imageNames)
        
    }
    
    //home_normal@2x,       home_select@2x
    //community_normal@2x           community_select@2x
    //  shop_normal@2x        shop_select@2x
    //shike_normal@2x           shike_select@2x
    //mine_normal@2x            mine_select@2x
    
    
    
    
    func createCustomTabbar(titleNames:[String], imageNames:[String]){
    
        
        bgView = UIView.createView()
        
        bgView?.backgroundColor = UIColor.whiteColor()
        bgView?.layer.borderColor = UIColor.grayColor().CGColor
        bgView?.layer.borderWidth = 1
        
        
        view.addSubview(self.bgView!)
        
        
        bgView?.snp_makeConstraints(closure: {
            
//            [weak self]
            (make) in
            
            make.left.right.equalTo(self.view)
            
            make.bottom.equalTo(self.view)
            
            make.top.equalTo(self.view.snp_bottom).offset(-49)
            
            
            
            
            
            
            
        })
        
    
        let width = kScreenWidth/5.0
        
        
        for i in 0..<imageNames.count{
        
            
            
            let imageName = imageNames[i]
            
            let titleName = titleNames[i]
            
            let bgImageName = imageName + "_normal"
            let selectBgImageName = imageName + "_select"
            let btn = UIButton.createBtn(nil, bgImageName: bgImageName, selectBgImageName: selectBgImageName, target: self, action: #selector(clickBtn(_:)))
            
            bgView?.addSubview(btn)
        
        
            
            
            btn.snp_makeConstraints(closure: {
                [weak self]
                (make) in
                
                
                make.top.bottom.equalTo(self!.bgView!)
                
                
                
                make.width.equalTo(width)
                
                
                make.left.equalTo(width*CGFloat(i))
                
                
                
                
                
                
                
            })
        
        
        
            let label = UILabel.createLabel(titleName, font: UIFont.systemFontOfSize(8), textAligment: .Center, textColor: UIColor.grayColor())
            
            
            
            btn.addSubview(label)
            
            
        
            label.snp_makeConstraints(closure: { (make) in
                
                
                make.left.right.equalTo(btn)
                
                
                make.top.equalTo(btn).offset(32)
                
                make.height.equalTo(12)
                
                
                
            })
        
        
            
            btn.tag = 300 + i
            label.tag = 400
            
            
            if  i == 0 {
                btn.selected = true
                label.textColor = UIColor.orangeColor()
            }
        }
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}





extension MainTabBarController{



    func clickBtn(curBtn: UIButton){

    
        let lastBtnView = bgView!.viewWithTag(300+selectedIndex)
        
        print(lastBtnView?.description)
        
        if let tmpBtn = lastBtnView{
            let lastBtn = tmpBtn as! UIButton
        
            let lastView = tmpBtn.viewWithTag(400)
            
            
            if let tmpLabel = lastView{
            
                let lastLabel = tmpLabel as! UILabel
            
            
                lastBtn.selected = false
                
                
                
                
                lastLabel.textColor = UIColor.grayColor()
            
            
            }
        
        }
        
    
        
        
        let curLabelView = curBtn.viewWithTag(400)
        
        if let tmpLabel = curLabelView{
        
        
            let curLabel = tmpLabel as! UILabel
            
            
            
            curBtn.selected = true
            
            curLabel.textColor = UIColor.orangeColor()
        
        
        
        
        
        
        
        
        
        
        
        }
        
        
        
        selectedIndex = curBtn.tag - 300





        }


    }
