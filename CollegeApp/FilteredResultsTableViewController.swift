//
//  FilteredResultsTableViewController.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/19/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit

class FilteredResultsTableViewController: UITableViewController {
    
    var filteredSnapshots: [Snapshot] = [];
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //edit and add buttons
        //self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        self.tableView.rowHeight = 110
        
        if(GlobalVariables.currentCollege == "All Colleges")
        {
            filteredSnapshots = GlobalVariables.allSnapshots
        }
        else
        {
            for college in GlobalVariables.allSnapshots
            {
                if(college.university == GlobalVariables.currentCollege)
                {
                    filteredSnapshots.append(college)
                }
            }
        }
    
        GlobalVariables.originalFilteredSnapshots = filteredSnapshots
        GlobalVariables.filteredSnapshots = filteredSnapshots
        
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
        self.view.reloadInputViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    // UNCOMMENT WHEN NECESSARY
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = GlobalVariables.filteredSnapshots[indexPath.row]
                (segue.destinationViewController as! DetailViewController).detailItem = object
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalVariables.filteredSnapshots.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
                
        tableView.registerClass(CustomCell.self, forCellReuseIdentifier: "Cell")
        
        let customCell: CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)as! CustomCell
        
        customCell.setAllLabels(GlobalVariables.filteredSnapshots[indexPath.row])
        
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
