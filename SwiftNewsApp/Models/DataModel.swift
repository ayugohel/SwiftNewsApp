
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON

class NewsDataModel : NSObject, NSCoding {
    
    var selftext : String!
    var title : String!
    var thumbnail : String!

    override init() {
        super.init()
    }
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        selftext = json["selftext"].stringValue
        title = json["title"].stringValue
        thumbnail = json["thumbnail"].stringValue
        
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        
        if selftext != nil{
            dictionary["selftext"] = selftext
        }
        if title != nil{
            dictionary["title"] = title
        }
        if thumbnail != nil{
            dictionary["thumbnail"] = thumbnail
        }
        
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
       
         selftext = aDecoder.decodeObject(forKey: "selftext") as? String
         thumbnail = aDecoder.decodeObject(forKey: "thumbnail") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String


    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        
        if selftext != nil{
            aCoder.encode(selftext, forKey: "selftext")
        }
        if thumbnail != nil{
            aCoder.encode(thumbnail, forKey: "thumbnail")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }
        
    }
    
    
    internal class func modelsFromDictionaryArray(array:[JSON]) -> [NewsDataModel] {
        var models:[NewsDataModel] = []
        
        _ = array.compactMap({ (item) -> Void in
            models.append(NewsDataModel(fromJson: item))
        })
        
        return models
    }
    
    internal class func dictArrayFromModelArray(array:[NewsDataModel]) -> [Dictionary<String,Any>] {
        var arrayData : [Dictionary<String,Any>] = []
        
        _ = array.compactMap({ (item) -> Void in
            arrayData.append(item.toDictionary())
        })
        
        return arrayData
    }

}



class ChildrenModel : NSObject, NSCoding{

    var data : NewsDataModel!
    var kind : String!
    
    override init() {
        super.init()
    }


    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        let dataJson = json["data"]
        if !dataJson.isEmpty{
            data = NewsDataModel(fromJson: dataJson)
        }
        kind = json["kind"].stringValue
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if data != nil{
            dictionary["data"] = data.toDictionary()
        }
        if kind != nil{
            dictionary["kind"] = kind
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
         data = aDecoder.decodeObject(forKey: "data") as? NewsDataModel
         kind = aDecoder.decodeObject(forKey: "kind") as? String

    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if data != nil{
            aCoder.encode(data, forKey: "data")
        }
        if kind != nil{
            aCoder.encode(kind, forKey: "kind")
        }

    }
    
        internal class func modelsFromDictionaryArray(array:[JSON]) -> [ChildrenModel] {
            var models:[ChildrenModel] = []
            
            _ = array.compactMap({ (item) -> Void in
                models.append(ChildrenModel(fromJson: item))
            })
            
            return models

        }
        
        internal class func dictArrayFromModelArray(array:[ChildrenModel]) -> [Dictionary<String,Any>] {
            var arrayData : [Dictionary<String,Any>] = []
            
            _ = array.compactMap({ (item) -> Void in
                arrayData.append(item.toDictionary())
            })

            return arrayData
        }

}
