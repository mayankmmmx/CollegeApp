//
//  CollegesTableViewController.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 4/17/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit

class CollegesTableViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var onlyColleges  = [Snapshot]()
    var names = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.rowHeight = 110
        
        let closeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "close:")
        self.navigationItem.leftBarButtonItem = closeButton
        
        for college in GlobalVariables.allSnapshots
        {
            if(!names.contains(college.university))
            {
                names.append(college.university)
                onlyColleges.append(college)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func close(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
        
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return onlyColleges.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.registerClass(CustomCollegeCell.self, forCellReuseIdentifier: "Cell")
        let customCell: CustomCollegeCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCollegeCell
        
        customCell.setAllLabels(onlyColleges[indexPath.row].university)
        
        return customCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        GlobalVariables.favoriteSnapshots.append(onlyColleges[indexPath.row])
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
}
