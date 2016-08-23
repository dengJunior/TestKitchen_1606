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
    
    private var foodView: CBMaterialView?
    
    private var categoryView: CBMaterialView?
    
    
    private var segCtrl: KTCSegmentCtrl?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        createMyNav()
        
        createHomePageView()
        
        downloadFoodData()
        downloadRecommendData()
        
        
    }

    
    func downloadFoodData(){
    
    
//        let dict = ["methodName": "MaterialSubtype","token": "", "user_id":"" , "version": "4.5"]
    
        let dict = ["methodName": "MaterialSubtype"]
        
        
        let downloader = KTCDownloader()
        downloader.delegate = self
        
        downloader.type = KTCDownloaderType.FoodMaterial
        
        downloader.postWithUrl(kHostUrl, paras: dict)
        
        
    
    
        
    
    
    
    }
    
    
    
    
    
    func createHomePageView(){
    
        self.automaticallyAdjustsScrollViewInsets = false
        
        
        
        
        let scrollView = UIScrollView()
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        
        
        scrollView.snp_makeConstraints { [weak self] (make) in
            
//            make.edges.equalTo(self!.view)

            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
            
            
        }
        
        
        let containerView = UIView.createView()
        scrollView.addSubview(containerView)
        
        containerView.snp_makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.height.equalTo(scrollView)
            
            
        }
       
        //MARK:- recommendView
        recommendView = CBRecommendView()
        containerView.addSubview(recommendView!)
        
         recommendView?.snp_makeConstraints(closure: { (make) in
            
            make.top.bottom.equalTo(containerView)
            
            
            make.width.equalTo(kScreenWidth)
            
            make.left.equalTo(containerView)
            
            
            
         })
        //MARK:- recommendView
        
        //MARK:- foodView
        
        foodView = CBMaterialView()
        
        foodView?.backgroundColor = UIColor.redColor()
        
        containerView.addSubview(foodView!)
        
        
        foodView?.snp_makeConstraints(closure: { (make) in
            
            
            
            make.top.bottom.equalTo(containerView)
            
            
            make.width.equalTo(kScreenWidth)
            
            make.left.equalTo((recommendView?.snp_right)!)
            
            
        })
        
        //MARK:- foodView
        
        //MARK:- categoryView
        categoryView = CBMaterialView()
        
        categoryView?.backgroundColor = UIColor.purpleColor()
        
        containerView.addSubview(categoryView!)
        
        
        categoryView?.snp_makeConstraints(closure: { (make) in
            
            make.top.bottom.equalTo(containerView)
            
            
            make.width.equalTo(kScreenWidth)
            
            make.left.equalTo((foodView?.snp_right)!
            )
            
            
            
            
            
        })
        
        //MARK:- categoryView
        
        
        containerView.snp_makeConstraints { (make) in
            
            
            
            make.right.equalTo(categoryView!)
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//        
//        recommendView = CBRecommendView()
//        
//        
//        
//        containerView.addSubview(recommendView!)
//    
//    
        
//        recommendView?.snp_makeConstraints( closure: {    [weak self]     (make) in
//            
//            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
//            
//            
//        })
//    
        
        
        
        
        
        
        
        
        
    
    
    
    }
    
    
    
    
    
    func downloadRecommendData(){
        
        
        let dict = ["methodName":"SceneHome","token":"","user_id":"","version":"4.5"]
        
        
        
        let downloader = KTCDownloader()
        
        downloader.delegate = self
        downloader.type = KTCDownloaderType.Recommend
        downloader.postWithUrl(kHostUrl, paras: dict)
    
    
    
    
    }
    
    
    func createMyNav(){
    
        
        
        
        segCtrl = KTCSegmentCtrl(frame: CGRectMake(80, 0, kScreenWidth-80*2, 44), titleNames: ["推荐","食材","分类"])
        
        navigationItem.titleView = segCtrl
    
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
        
        
        
        
        
        if downloader.type == KTCDownloaderType.Recommend{
        
        
//            let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
            
//            print(str)
            
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

        
        
        
        
        }else if downloader.type == KTCDownloaderType.FoodMaterial{
            
            
            if let jsonData = data{
            
                let model = CBMaterialModel.palseModelWithData(jsonData)
            
            
                print(model)
            
            
            }
            
            
            
            
            
            
        }else if downloader.type == KTCDownloaderType.Category{
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
        
        
        
        
        
        //MARK:-   bejson
        
        
        
        
        
    }












}