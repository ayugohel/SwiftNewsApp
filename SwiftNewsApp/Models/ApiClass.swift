//
//  ApiClass.swift
//  SwiftNewsApp
//
//  Created by Ayushi on 2020-07-26.
//  Copyright © 2020 Ayushi. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class ApiClass: NSObject {
    
    static let shared = ApiClass()

    override init() {
        super.init()
    }

    func apiSwiftNews(_ handler : @escaping (( [NewsDataModel] ) -> Void )) {
        
        let url = "https://www.reddit.com/r/swift/.json"
        
        let request = URLRequest(url: URL(string: url )!)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response ?? "")
            
            if error == nil && data != nil {
                
                do {
                    
                    let json = try JSON(data: data!)
                    
                    let childData : [ChildrenModel] = ChildrenModel.modelsFromDictionaryArray(array: json["data"]["children"].arrayValue)
                    
                    var newsData : [NewsDataModel] = []
                    
                    _ = childData.compactMap { (item) -> Void in
                        newsData.append(item.data)
                    }
                    
                    handler(newsData)
                    
                } catch {
                    print("error")
                }
            }
        })
        task.resume()
        
    }
    
}
