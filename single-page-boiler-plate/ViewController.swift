//
//  ViewController.swift
//  single-page-boiler-plate
//
//  Created by Dan Seethaler on 4/6/16.
//  Copyright © 2016 Dan Seethaler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var itemsEnum = Items()
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 122/255, green: 170/255, blue: 61/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        itemsEnum.loadItems(0, end: 10, itemsLoadedCallback: itemsDownloaded)
        
    }
    
    func itemsDownloaded(itemsList: [Item]) -> () {
        
        for item in itemsList {
            items.append(item)
        }

        tableView.reloadData()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ItemDetailVC" {
            if let detailsVC = segue.destinationViewController as? ItemDetailVC {
                if let item = sender as? Item {
                    detailsVC.item = item
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ItemCell") as? ItemCell {
            
            cell.request?.cancel()
            
            let item = items[indexPath.row]
            
            let img = ItemCell.imageCache.objectForKey(item.image_main!) as? UIImage
            
            cell.configureCell(item, img: img)
            
            return cell
            
        }
        
        return ItemCell()
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("ItemDetailVC", sender: items[indexPath.row])
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    

}

