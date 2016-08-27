//
//  KTCHomeViewController.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/26.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class KTCHomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    
//    override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        
//        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let ctrl = appDele.window?.rootViewController
//        
//        if ctrl?.isKindOfClass(MainTabBarController.self) == true{
//            
//            
//            let mainTabBarCtrl = ctrl as! MainTabBarController
//            
//            mainTabBarCtrl.hideTabBar()
//            
//            
//        }
//        
//        
//        
//        
//    }
    
    
    
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let ctrl = appDele.window?.rootViewController
        
        if ctrl?.isKindOfClass(MainTabBarController.self) == true{
            
            
            let mainTabBarCtrl = ctrl as! MainTabBarController
            
            mainTabBarCtrl.showTabBar()
            
            
        }
        
        
        
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let appDele = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let ctrl = appDele.window?.rootViewController
        
        if ctrl?.isKindOfClass(MainTabBarController.self) == true{
            
            
            let mainTabBarCtrl = ctrl as! MainTabBarController
            
            mainTabBarCtrl.hideTabBar()
            
            
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
