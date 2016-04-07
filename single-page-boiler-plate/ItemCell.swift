//
//  ItemCell.swift
//  single-page-boiler-plate
//
//  Created by Dan Seethaler on 4/6/16.
//  Copyright © 2016 Dan Seethaler. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainDescription: UITextView!
    
    var item: Item!
    static var imageCache = NSCache()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainImg.layer.cornerRadius = 10
        mainImg.clipsToBounds = true
        
    }
    
    func configureCell (item: Item, img: UIImage?){
        
        self.item = item
        
        mainTitle.text = item.title.uppercaseString
        mainDescription.text = item.description
        
        // mainDescription formatting
        mainDescription.userInteractionEnabled = false
        mainDescription.editable = false
        mainDescription.sizeToFit()
        
        if img != nil {
            
            self.mainImg.image = img
            
        } else {
            
            Alamofire.request(.GET, item.imageURL).validate(contentType: ["image/*"]).response(completionHandler: { (request, response, data, err) in
                
                if err == nil {
                    
                    let img = UIImage(data: data!)!
                    self.mainImg.image = img
                    ItemCell.imageCache.setObject(img, forKey: self.item.imageURL)
                    
                    
                }else {
                    print(request)
                    print(err.debugDescription)
                }
                
            })
        }
        
    }
    
}
