//
//  BaseViewController.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/15.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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





extension BaseViewController{

    
    
    func addNavTitle(title: String){
    
        
        
        let titleLabel = UILabel.createLabel(title, font: UIFont.boldSystemFontOfSize(24), textAligment: .Center, textColor: UIColor.blackColor())

        
        navigationItem.titleView = titleLabel
    
    
    
    
    
    
    
    
    }


    



    
    
    func addNavBtn(imageName: String, target: AnyObject?, action: Selector, isLeft: Bool ){
    
    
        
        
        let btn = UIButton.createBtn(nil, bgImageName: imageName, selectBgImageName:nil, target: self, action: action)
    
        btn.frame = CGRectMake(0, 4, 40, 36)
        
        let barBtnItem = UIBarButtonItem(customView: btn)
        
        
        if isLeft{
        
        
            navigationItem.leftBarButtonItem = barBtnItem
        //MARK:-   加载在 视图上了
        
        }else{
        
        
        
            navigationItem.rightBarButtonItem = barBtnItem
        
        
        
        
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    }







    
    func addNavBackBtn() {
        
        addNavBtn("nav_back_black", target: self, action: #selector(backAction), isLeft: true)
        
        
    }





    
    func backAction(){
    
    
        navigationController?.popViewControllerAnimated(true)
    
    
    }









}
