//
//  CookBookViewController.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/15.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

class CookBookViewController: BaseViewController {

    //1
    private var recommendView: CBRecommendView?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        createMyNav()
        
        createHomePageView()
        
        
        downloadRecommendData()
        
        
    }

    
    func createHomePageView(){
    
        self.automaticallyAdjustsScrollViewInsets = false
        recommendView = CBRecommendView()
        
        
        
        view.addSubview(recommendView!)
    
    
        
        recommendView?.snp_makeConstraints( closure: {    [weak self]     (make) in
            
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
            
            
        })
    
    
    
    
    }
    
    
    
    
    
    func downloadRecommendData(){
        
        
        let dict = ["methodName":"SceneHome","token":"","user_id":"","version":"4.5"]
        
        
        
        let downloader = KTCDownloader()
        
        downloader.delegate = self
        downloader.postWithUrl(kHostUrl, paras: dict)
    
    
    
    
    }
    
    
    func createMyNav(){
    
    
        addNavBtn("saoyisao", target: self, action: #selector(scanAction), isLeft: true)
    
        
        
        addNavBtn("search", target: self, action: #selector(searchAction), isLeft: false)
    
    
    
    
    
    
    
    }
    
    
    
    
    func scanAction(){}
    
    
    
    func searchAction(){}
    
    
    
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





extension CookBookViewController: KTCDownloadDelegate{

    func downloader(downloader: KTCDownloader, didFailWithError error: NSError) {
        print(error.description)
    }
    
    
    
    
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
        
        
        
        let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
        
        
        print(str!)
        
        if let jsonData = data{
        
        
            let model = CBRecommendModel.parseModel(jsonData)
        
        
            print("__________________________________________________________________")
            dispatch_async(dispatch_get_main_queue()) {
                
                [weak self] in
                
                self!.recommendView?.model = model
                
                
                
                
            }

        }
        
        
        
        
        
        
        //MARK:-   bejson
        
        
        
        
        
    }












}