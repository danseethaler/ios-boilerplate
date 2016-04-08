//
//  Item.swift
//  single-page-boiler-plate
//
//  Created by Dan Seethaler on 4/6/16.
//  Copyright © 2016 Dan Seethaler. All rights reserved.
//

import Foundation
import UIKit

class Item {
    
    private var _title: String?
    private var _description: String?
    private var _image_main: String?
    private var _imageThumbUrl: NSURL?
    private var _imageHRUrl: NSURL?
    
    var title: String? {
        return _title
    }
    
    var description: String? {
        return _description
    }
    
    var image_main: String? {
        return _image_main
    }
    
    var imageThumbUrl: NSURL? {
        return _imageThumbUrl
    }
    
    var imageHRUrl: NSURL? {
        return _imageHRUrl
    }

    
    init(data:AnyObject) {
        
        
        if let title = data["title"] as? String {
            _title = title
        }
        
        if let description = data["description"] as? String {
            _description = description
        }
        
        if let image_main = data["image_main"] as? String {
            _image_main = image_main
            
            _imageThumbUrl = getImgUrlScaled(300)
            _imageHRUrl = getImgUrlScaled(1500)
            
        }
        
        
    }
    
    
    
    func getImgUrlScaled(scale:Int) -> NSURL? {
        
        if let image_mainString = image_main {
            
            let thumbUrl = image_mainString.stringByReplacingOccurrencesOfString("/df/", withString: "/maxD_\(scale)/")
            
            return NSURL(string: thumbUrl);
        }
        
        return nil
        
    }
    
}