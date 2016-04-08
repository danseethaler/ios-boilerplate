//
//  ItemDetailVC.swift
//  single-page-boiler-plate
//
//  Created by Dan Seethaler on 4/7/16.
//  Copyright © 2016 Dan Seethaler. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ItemDetailVC: UIViewController {
    
    var item: Item!

    @IBOutlet weak var itemTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDetailView()
        
    }
    
    func setupDetailView () {
        
        itemTitle.title = item.title
//        
//        let fullRes = getFullImgUrl()
//        
//        if let fullRes = fullRes {
//            
//            Alamofire.request(.GET, fullRes).validate(contentType: ["image/*"]).response(completionHandler: { (request, response, data, err) in
//                
//                if err == nil {
//                    
////                    // Create UIIMage object
////                    let img = UIImage(data: data!)!
////                    // Manually create UIImageView
////                    let imageView = UIImageView(image: image!)
////                    
////                    self.mainImg.image = img
////                    ItemCell.imageCache.setObject(img, forKey: self.item.imageURL)
////                    
////                    
////                    
////                    imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
////                    view.addSubview(imageView)
//                    
//                    
//                }else {
//                    print(request)
//                    print(err.debugDescription)
//                }
//                
//            })
//            
//        }
        
        
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.width * scale
        UIGraphicsBeginImageContext(CGSizeMake(newHeight, newWidth))
        image.drawInRect(CGRectMake(0, 0, newHeight, newWidth))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
        
    }
    
//    @IBOutlet weak var mainTitle: UILabel!
//    @IBOutlet weak var mainImg: UIImageView!
//    @IBOutlet weak var mainDescription: UITextView!
//    
//    var item: Item!
//    static var imageCache = NSCache()
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        mainImg.layer.cornerRadius = 10
//        mainImg.clipsToBounds = true
//        
//    }
//    
//    func configureCell (item: Item, img: UIImage?){
//        
//        self.item = item
//        
//        mainTitle.text = item.title.uppercaseString
//        mainDescription.text = item.description
//        
//        // mainDescription formatting
//        mainDescription.userInteractionEnabled = false
//        mainDescription.editable = false
//        mainDescription.sizeToFit()
//        
//        if img != nil {
//            
//            self.mainImg.image = img
//            
//        } else {
//        }
//        
//    }
    

    

}