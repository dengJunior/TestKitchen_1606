//
//  CBMaterialModel.swift
//  TestKitchen
//
//  Created by 邓江洲 on 16/8/23.
//  Copyright © 2016年 邓江洲. All rights reserved.
//

import UIKit
import SwiftyJSON
class CBMaterialModel: NSObject {
        
        var code: String?
        var msg: String?
        var version: String?
    
        var timestamp: NSNumber?
        var data: CBMaterialDataModel?
    
    
    class func palseModelWithData(data: NSData) -> CBMaterialModel {
        
        
        let jsonData = JSON(data: data)
        
        let model = CBMaterialModel()
        
        model.code = jsonData["code"].string
        model.msg = jsonData["msg"].string
        model.version = jsonData["version"].string
        
        
        
        model.timestamp = jsonData["timestamp"].number
        
        let dataJSON = jsonData["data"]
        
        model.data = CBMaterialDataModel.parseModel(dataJSON)
        
        
        
        
        return model
        
        
        
    }
    
    
    
    
    
    
    
    
}


class CBMaterialDataModel: NSObject{
    
    var id: NSNumber?
    var text: String?
    var name: String?
    var data: Array<CBMaterialTypeModel>?
    
    
    
    
    class func parseModel(jsonData: JSON) -> CBMaterialDataModel{
    
        let model = CBMaterialDataModel()
        
        model.id = jsonData["id"].number
        model.text = jsonData["text"].string
        model.name = jsonData["name"].string
        
        
        var array = Array<CBMaterialTypeModel>()
        
                    for (_,subjson) in jsonData["data"] {
                    
                        let typeModel = CBMaterialTypeModel.parseModel(subjson)
                        
                        array.append(typeModel)
            
            
                            }
        model.data = array
        
        return model
        
                }
        }



class CBMaterialTypeModel: NSObject{

    var id: String?
    var text: String?
    var image: String?
    var data: Array<CBMaterialSubtypeModel>?

    
    class func parseModel(jsonData: JSON) -> CBMaterialTypeModel{
    
    
        let model = CBMaterialTypeModel()
    
    
    
        model.id = jsonData["id"].string
        model.text = jsonData["text"].string
        model.image = jsonData["image"].string
        
        var array = Array<CBMaterialSubtypeModel>()
        for (_,subjson) in jsonData["data"]{
        
            let subtypeModel = CBMaterialSubtypeModel.palseModel(subjson)
            
            
            array.append(subtypeModel)
        
            
        }
    
    
    
        model.data = array
    
    
    
        return model
    }
    
    


}



class CBMaterialSubtypeModel: NSObject {
 
    var id: String?
    var text: String?
    var image: String?
    
    
    class func palseModel(jsonData: JSON) -> CBMaterialSubtypeModel {
    
        
        let model = CBMaterialSubtypeModel()
        
        model.id = jsonData["id"].string
        
        model.text = jsonData["text"].string
        
        
        model.image = jsonData["image"].string
        
    
        return model
    }
    
    
    
    
    

}


