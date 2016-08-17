//
//  CBRecommendModel.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/16.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit
import SwiftyJSON



class CBRecommendModel: NSObject {
    
    
    var code: NSNumber?
    var msg: Bool?
    
    var version: String?
    var timestamp: NSNumber?
    
    var data: CBRecommendDataModel?
    
    
    
    class func parseModel(data: NSData) -> CBRecommendModel {
    
    
    
        let model = CBRecommendModel()
        
        let jsonData = JSON(data: data)
        
        model.code = jsonData["code"].number
        model.msg = jsonData["msg"].bool
        model.version = jsonData["version"].string
        model.timestamp = jsonData["timestamp"].number
        
        
        
        let dataDict = jsonData["data"]
        
    
    
        model.data = CBRecommendDataModel.parseModel(dataDict)
    
    
    
    
    
    
    
    
    
    
    
    
    
        return model
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}




class CBRecommendDataModel: NSObject{


    var banner: Array<CBRecommendBannerModel>?
    
    
    var widgetList: Array<CBRecommendWidgetListModel>?
    
    
    
    
    
    class func parseModel(jsonData: JSON) -> CBRecommendDataModel {
    
        let model = CBRecommendDataModel()
        
        
        let bannerArray = jsonData["banner"]
        
        var bArray = Array<CBRecommendBannerModel>()
        
        for (_,subjson) in bannerArray{
        
        
            
            let bannerModel = CBRecommendBannerModel.parseModel(subjson)
            
            
            
            
            
            bArray.append(bannerModel)
        
        
        
        
        
        
        
        
        
        
        }
        
        
        
        
    
    
        model.banner = bArray
    
    
    
        let listArray = jsonData["widgetList"]
        var wlArray = Array<CBRecommendWidgetListModel>()
        
        
        for (_,subjson) in listArray{
        
        
        
            
            let wlModel = CBRecommendWidgetListModel.parseModel(subjson)
            
            
            wlArray.append(wlModel)
            
            
        
        
        
        
        
        
        
        
        
        
        }
        
        
        model.widgetList = wlArray
        
        
        
        
        
        
        
        
        
        
    
    
        return model
    
    
    }
    
    
    
    
    
    



}




class CBRecommendBannerModel: NSObject{


    var banner_id: NSNumber?
    
    var banner_title: String?
    
    var banner_picture: String?
    
    
    var banner_link: String?
    
    var is_link: NSNumber?
    
    var refer_key: NSNumber?
    
    var type_id: NSNumber?
    
    
    
    class func parseModel(jsonData: JSON) -> CBRecommendBannerModel {
        
        
        let model = CBRecommendBannerModel()
        
        model.banner_id = jsonData["banner_id"].number
        model.banner_title = jsonData["banner_title"].string
        model.banner_picture = jsonData["banner_picture"].string
        
        
        model.banner_link = jsonData["banner_link"].string
        model.is_link = jsonData["is_link"].number
        model.refer_key = jsonData["refer_key"].number
        
        model.type_id = jsonData["type_id"].number
        
        
        
        
        
        
        
        
        return model
        
    }
    
    




}



class CBRecommendWidgetListModel: NSObject{


    var widget_id: NSNumber?
    var widget_type: NSNumber?
    var title: String?
    
    
    var title_link: String?
    var desc:String?
    var widget_data: Array<CBRecommendWidgeDataModel>?
    
    
    
    
    class func parseModel(jsonData: JSON) -> CBRecommendWidgetListModel {
        
        let model = CBRecommendWidgetListModel()
        
        
        model.widget_id = jsonData["widget_id"].number
        model.widget_type = jsonData["widget_type"].number
        model.title = jsonData["title"].string
        
        model.title_link = jsonData["title_link"].string
        model.desc = jsonData["desc"].string
        let dataArray = jsonData["widget_data"]
        
        
        var wdArray = Array<CBRecommendWidgeDataModel>()
        
        
        for (_,subjson) in dataArray{
        
        
            
            let wdModel = CBRecommendWidgeDataModel.parseModel(subjson)
            
            wdArray.append(wdModel)
            
        
        
        
        
        
        
        }
        
        
        model.widget_data = wdArray
        
        
        
        
        return model
    }
    
    




}





class CBRecommendWidgeDataModel: NSObject{


    var id: NSNumber?
    
    var type: String?
    
    var content: String?
    
    var link: String?
    
    
    
    class func parseModel(jsonData: JSON) -> CBRecommendWidgeDataModel{
    
    
    
        
            let model = CBRecommendWidgeDataModel()
        
        
            model.id = jsonData["id"].number
            model.type = jsonData["type"].string
        
        
            model.content = jsonData["content"].string
            model.link = jsonData["link"].string
        
    
    
    
    
    
    
    
    
    
    
    
    
    
        return model
    
    }







}














