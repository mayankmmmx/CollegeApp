//
//  MasterViewController.swift
//  test
//
//  Created by Mayank Makwana on 4/16/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit
import Parse

class FavoritesRegisterTableViewController: UITableViewController {
    
    var detailViewController: DetailViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
        self.view.reloadInputViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBarHidden = false
        
        self.tableView.rowHeight = 110
                
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "openColleges:")
        self.navigationItem.rightBarButtonItem = addButton
        
        let closeButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "doneAll:")
        self.navigationItem.leftBarButtonItem = closeButton
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func openColleges(sender: UIBarButtonItem) {
        performSegueWithIdentifier("showColleges", sender: self)
    }
    
    func doneAll(sender: UIBarButtonItem)
    {
        dismissViewControllerAnimated(true, completion: nil)
       // performSegueWithIdentifier("doneAll", sender: self)
        
        let newUser = PFUser()
        newUser.username = GlobalVariables.newUsername
        newUser.password = GlobalVariables.newPassword
        newUser.email = GlobalVariables.newEmail
        newUser.setValue(snapshotsToString(), forKey: "Favorites")
        newUser.setValue(GlobalVariables.newScores, forKey: "Scores")
        newUser.signUp()
    }
    
    func snapshotsToString() -> [String]
    {
        var stringSnap: [String] = []
        
        for snap in GlobalVariables.favoriteSnapshots
        {
            stringSnap.append(snap.university)
        }
        
        return stringSnap
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalVariables.favoriteSnapshots.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.registerClass(CustomCollegeCell.self, forCellReuseIdentifier: "Cell")
        let customCell: CustomCollegeCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCollegeCell
        
        customCell.setAllLabels(GlobalVariables.favoriteSnapshots[indexPath.row].university)
        
        return customCell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            GlobalVariables.favoriteSnapshots.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

