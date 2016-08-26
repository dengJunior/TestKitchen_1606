//
//  KTCDownloader.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/16.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit

import Alamofire


public enum KTCDownloaderType: Int{

    
    case Default = 10
    
    case Recommend
    
    case FoodMaterial
    
    case Category
    
    case FoodCourse
    case FoodCourseComment
    
    
    
    
}







protocol KTCDownloadDelegate: NSObjectProtocol {
    
    
    func downloader(downloader: KTCDownloader, didFailWithError error: NSError)
    
    
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?)
    
    
    
    
}










class KTCDownloader: NSObject {
    
    
    

    weak var delegate: KTCDownloadDelegate?
    var type: KTCDownloaderType = .Default
    
    
    
    func postWithUrl(urlString: String, paras: Dictionary<String,String> ){
    
        
        
        var newParam = paras
//        newParam["methodName"] = "SceneHome"
        newParam["token"] = ""
        newParam["user_id"] = ""
        newParam["version"] = "4.5"
        
        
        Alamofire.request(.POST, urlString, parameters: newParam, encoding: ParameterEncoding.URL, headers: nil).responseData { (response) in
            
            
            
            switch response.result{
            
            
            
                case .Failure(let error):
                
                
//                    print(error)
                
                    self.delegate?.downloader(self, didFailWithError: error)
                
                
                
                
                case .Success:
            
            
            
//                    print(response.data!)
            
            
            
                    self.delegate?.downloader(self, didFinishWithData: response.data)
            
            
            
            
            
            }
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }
        
        
        
        
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
