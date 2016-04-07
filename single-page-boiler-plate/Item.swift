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
    
    private var _title: String!
    private var _description: String!
    private var _imageURL: NSURL!
    var imageView: UIImageView!
    
    var title: String {
        return _title
    }
    
    var description: String {
        return _description
    }
    
    var imageURL: NSURL {
        return _imageURL
    }

    init(title:String?, description: String?, imageURL: NSURL?) {
        
        self._title = title
        self._description = description
        self._imageURL = imageURL
        
    }
    
}