//
//  FCComment.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/26.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit
import SwiftyJSON


class FCComment: NSObject {
    
    
    
    var code: String?
    var msg: String?
    var version: String?
    
    var timestamp: NSNumber?
    var data: FCCommentData?
    
    
    class func parseWithData(data: NSData) -> FCComment {
    
        let jsonData = JSON(data: data)
        let commentModel = FCComment()
    
        commentModel.code = jsonData["code"].string
        commentModel.msg = jsonData["msg"].string
        commentModel.version = jsonData["version"].string
        
        
        commentModel.timestamp = jsonData["timestamp"].number
        
        
        commentModel.data = FCCommentData.parseModel(jsonData["data"])
    
    
    
    
        return commentModel
    
    }
    
   

}



class FCCommentData: NSObject{


    var page: String?
    var size: String?
    var total: String?
    
    
    var count: String?
    var data: Array<FCCommentDetail>?



    
    class func parseModel(jsonData: JSON) -> FCCommentData {
        
        
        let dataModel = FCCommentData()
        
        dataModel.page = jsonData["page"].string
        dataModel.size = jsonData["size"].string
        dataModel.total = jsonData["total"].string
        
        
        dataModel.count = jsonData["count"].string
        
        var array = Array<FCCommentDetail>()
        for (_,subjson) in jsonData["data"]{
            let dModel = FCCommentDetail.parseModel(subjson)
            array.append(dModel)
        }
        dataModel.data = array
        
        
        return dataModel
    }
}


class FCCommentDetail: NSObject{

    
    var id: String?
    var user_id: String?
    var type: String?
    
    
    var relate_id: String?
    var content: String?
    var create_time: String?
    
    
    var parent_id: String?
    var parents: Array<FCCommentDetail>?
    var nick: String?
    
    var head_img: String?
    var istalent: String?
    
    
    class func parseModel(jsonData: JSON) -> FCCommentDetail{
    
    
        let detailModel = FCCommentDetail()
        
        detailModel.id = jsonData["id"].string
        detailModel.user_id = jsonData["user_id"].string
        detailModel.type = jsonData["type"].string
        
        
        detailModel.relate_id = jsonData["relate_id"].string
        detailModel.content = jsonData["content"].string
        detailModel.create_time = jsonData["create_time"].string
        
        
        
        detailModel.parent_id = jsonData["parent_id"].string
        
        
        var array = Array<FCCommentDetail>()
        for (_,subjson) in jsonData["parents"]{
        
            let pModel = FCCommentDetail.parseModel(subjson)
            array.append(pModel)
        
        
        }
        
        detailModel.parents = array
        
        
        
        
        detailModel.nick = jsonData["nick"].string
        
        
        
        detailModel.head_img = jsonData["head_img"].string
        detailModel.istalent = jsonData["istalent"].string
        
        
        
    
    
        return detailModel
    
    
    }
    
    




}











