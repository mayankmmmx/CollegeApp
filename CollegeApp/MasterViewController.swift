//
//  MasterViewController.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/5/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import Parse
import UIKit

class MasterViewController: UITableViewController {
    
    var allSnapShots: [Snapshot] = [];
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //edit and add buttons
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        self.tableView.rowHeight = 110
        
        allSnapShots = GlobalVariables.allSnapshots
        let current = PFUser.currentUser()
        current?.setValue(GlobalVariables.deviceID, forKeyPath: "deviceID")
        current?.save()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = allSnapShots[indexPath.row]
                (segue.destinationViewController as! DetailViewController).detailItem = object
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allSnapShots.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let customCell: CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as CustomCell
        
        tableView.registerClass(CustomCell.self, forCellReuseIdentifier: "Cell")
        
        let customCell: CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
        
        customCell.setAllLabels(allSnapShots[indexPath.row])
        
        
        // var snapshot = allSnapShots[indexPath.row]
        //cell.textLabel.hidden = true
        
        // configureCell(cell, snapshot: allSnapShots[indexPath.row])
        
        //println(allSnapShots[indexPath.row].printSnapshot())
        
        //println(indexPath.row)
        
        
        return customCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetail", sender: self)
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
}