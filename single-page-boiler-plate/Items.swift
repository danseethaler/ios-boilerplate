//
//  TemplateModel.swift
//  single-page-boiler-plate
//
//  Created by Dan Seethaler on 4/6/16.
//  Copyright © 2016 Dan Seethaler. All rights reserved.
//

import Foundation
import Alamofire

class Items {
    
    var items = [Item]()
    
    let itemsUrl:String! = "https://dev.esafesite.com/apps/userlitestoreapps/recipes/v999/json/recipes.htp"
    
    func loadItems(start: Int, end: Int, itemsLoadedCallback: ([Item]) -> ()) {
        
        Alamofire.request(.GET, itemsUrl, parameters: ["limit": "50"])
            .responseJSON { response in
                // print(response.request)  // original URL request
                //                print(response.response) // URL response
                //                print(response.data)     // server data
                // print(response.result)   // result of response serialization
                
                if let itemsList = response.result.value {
                    
                    for item in itemsList as! [Dictionary<String, AnyObject>] {
                        
                        let imageURLString:String = item["imageURL"] as! String
                        
                        let imageUrlVal = NSURL(string: imageURLString)
                        
                        let itemTitle = item["title"] as! String
                        
                        let optionalDescription:String! = ""
                        
                        if let itemDescription = item["description"] as? String {
                            let itemOb = Item(title: itemTitle, description: itemDescription, imageURL: imageUrlVal!)
                            self.items.append(itemOb)
                        }else {
                            let itemOb = Item(title: itemTitle, description: optionalDescription!, imageURL: imageUrlVal!)
                            self.items.append(itemOb)
                        }
                        
                        
                    }
                    
                }
                
                itemsLoadedCallback(self.items)
                
        }
    }
    
    
}