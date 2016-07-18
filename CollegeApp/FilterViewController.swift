//
//  FilterViewController.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/14/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit

class FilterViewController: UITableViewController {
    
    //LIST ALL ITEMS: All colleges; and list of all colleges

    var collegeNameSnapshots: [String] = ["All Colleges"]
    var snapshotsAll: [Snapshot] = []

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 110
        
        for college in GlobalVariables.allSnapshots
        {
            if(!collegeNameSnapshots.contains(college.university))
            {
                collegeNameSnapshots.append(college.university)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  /*  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFilteredDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = snapshotsAll[indexPath.row]
                (segue.destinationViewController as DetailViewController).detailItem = object
            }
        }
    }*/
  
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return collegeNameSnapshots.count+1
        return collegeNameSnapshots.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.registerClass(CustomCollegeCell.self, forCellReuseIdentifier: "Cell")
        let customCell: CustomCollegeCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCollegeCell
    
        customCell.setAllLabels(collegeNameSnapshots[indexPath.row])
        
        return customCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showFilteredDetail", sender: self)
        GlobalVariables.currentCollege = collegeNameSnapshots[indexPath.row]
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    func imageResize (imageObj:UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
}
