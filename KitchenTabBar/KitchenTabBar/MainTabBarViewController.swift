//
//  MainTabBarViewController.swift
//  KitchenTabBar
//
//  Created by 邓江洲 on 16/8/15.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    
    
    private var array: Array<Dictionary<String,String>>?{
    
        
        get {
            
            
                let path = NSBundle.mainBundle().pathForResource("Control", ofType: ".json")
        
            
            
            var myArray:Array<Dictionary<String,String>>? = nil
            
            
            if let jsonpath = path {
            
                
                
                let data = NSData(contentsOfFile: jsonpath)
                
                if let jsonData = data{
                
                
                    do{
                    
                    
                        let jsonValue = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers)
                    
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
        
        self.createViewControllers()
        
        
        
    }

    
    
    
    
    
    
    func createViewControllers(){
    
    
        var controllerNames = [String]()
        
        
        
        if let tempArray = self.array{
        
            
            for dictionay in tempArray{
            
                
                let oneName = dictionay["ctrlName"]
            
                
                
                controllerNames.append(oneName!)
            
            
            
            
            }
            
        
        
        
        
        }else{print("@_@")}
        
        
        
        
        
        
        var viewControllers = Array<UINavigationController>()
        
        
        
        for i in 0..<controllerNames.count{
        
        
            
            
            
            let controllerName = "KitchenTabBar." + controllerNames[i]
            
            
            let viewControllerClass = NSClassFromString(controllerName) as! UIViewController.Type
            
            let viewController = viewControllerClass.init()
            
            
            let navigationViewController = UINavigationController(rootViewController: viewController)
            
            
            viewControllers.append(navigationViewController)
        
            
        }
    
        
    
            self.viewControllers = viewControllers
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
