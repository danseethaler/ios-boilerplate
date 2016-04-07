//
//  ItemDetailVC.swift
//  single-page-boiler-plate
//
//  Created by Dan Seethaler on 4/7/16.
//  Copyright © 2016 Dan Seethaler. All rights reserved.
//

import Foundation
import UIKit

class ItemDetailVC: UIViewController {
    
    var item: Item!
    
    @IBOutlet weak var itemTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        itemTitle.text = item.title
        
    }
    

}
