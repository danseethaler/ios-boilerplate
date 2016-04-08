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
                        
                        let itemOb = Item(data: item)
                        
                        self.items.append(itemOb)
                                                
                    }
                    
                }
                
                itemsLoadedCallback(self.items)
                
        }
    }
    
    
}