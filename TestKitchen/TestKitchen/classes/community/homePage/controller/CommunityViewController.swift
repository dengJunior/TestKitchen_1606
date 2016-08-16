//
//  CommunityViewController.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/15.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class CommunityViewController: BaseViewController /*, KTCDownloadDelegate*/{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellowColor()
        
        // Do any additional setup after loading the view.
    }
    
    //methodName=SceneHome&token=&user_id=&version=4.5
    func downloadRecommendData(){
    
    
        let dict = ["methodName":"SceneHome","token":"","user_id":"","version":"4.5"]
        
        
        
        let downloader = KTCDownloader()
        
//        downloader.delegate = self
        downloader.postWithUrl(kHostUrl, paras: dict)
        
        
        
        
        
    
    
    
    
    
    
    
    
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



extension CommunityViewController{}