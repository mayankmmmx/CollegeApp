//
//  FilterView.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/20/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit
import QuartzCore

class FilterView: UIViewController {

    
    let segmentbar: UISegmentedControl = UISegmentedControl(items: ["General","Scores"])
    var general: GeneralFilter = GeneralFilter()
    var scores: ScoresFilter = ScoresFilter()
    let apply: UIButton = UIButton(type: UIButtonType.System)
    let reset: UIButton = UIButton(type: UIButtonType.System)
    
    override func loadView() {
        super.loadView()
                
        let widthN = segmentbar.frame.width //width of segbar
        let heightN = segmentbar.frame.height //height of segbar 
        
        //Segment Bar Settings
        segmentbar.frame = CGRect(x: (GlobalVariables.screenWidth-widthN)/2, y: (GlobalVariables.screenHeight/25), width: widthN, height: heightN)
        segmentbar.selectedSegmentIndex = 0
        segmentbar.addTarget(self, action: "indexChanged:", forControlEvents: .ValueChanged)
        
        //Subview Frame Settings
        general = GeneralFilter(frame: CGRect(x: 0, y: (GlobalVariables.screenHeight/25)+heightN, width: GlobalVariables.screenWidth, height: GlobalVariables.screenHeight*0.8))
        scores = ScoresFilter(frame: CGRect(x: 0, y: (GlobalVariables.screenHeight/25)+heightN, width: GlobalVariables.screenWidth, height: GlobalVariables.screenHeight*0.8))
        
        //Buttons Frame Settings
        apply.frame = CGRect(x: GlobalVariables.screenWidth*0.53, y: GlobalVariables.screenHeight*0.85, width: GlobalVariables.screenWidth/5, height: GlobalVariables.screenHeight/15)
        reset.frame = CGRect(x: GlobalVariables.screenWidth*0.29, y: GlobalVariables.screenHeight*0.85, width: GlobalVariables.screenWidth/5, height: GlobalVariables.screenHeight/15)
        
        //Button Titles
        reset.setTitle("Reset", forState: UIControlState.Normal)
        apply.setTitle("Apply", forState: UIControlState.Normal)
        
        //Button Appearance Settings
        apply.layer.borderColor = self.view.tintColor.CGColor
        apply.layer.borderWidth = 1
        apply.layer.cornerRadius = 5
        
        reset.layer.borderColor = self.view.tintColor.CGColor
        reset.layer.borderWidth = 1
        reset.layer.cornerRadius = 5

        //Adds everything to the view
        self.view.addSubview(segmentbar)
        self.view.addSubview(general)
        self.view.addSubview(scores)
        self.view.addSubview(apply)
        self.view.addSubview(reset)
        
        //Add targets to UIButtons
        apply.addTarget(self, action: "applyButton:", forControlEvents: UIControlEvents.TouchDown)
        
        //Makes General the only viewable view
        scores.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func indexChanged(sender: UISegmentedControl)
    {
        _ = general.frame.width //configured for all general, scores, and other  as frame is same size for each
        _ = general.frame.height //configured for all general, scores, and other  as frame is same size for each
        
        switch sender.selectedSegmentIndex
        {
            case 0: //loads general frame
                general.hidden = false
                scores.hidden = true
            
            case 1: //loads scores frame
                general.hidden = true
                scores.hidden = false
            
            default:
                print("bruh what")
        }
    }
    
    func applyButton(sender: UIButton)
    {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
        generateFilteredSnapshots()
        
    }
    
    func generateFilteredSnapshots()
    {
        var generalFilter: [String: String] = general.getAllInfo()
        var scoresFilter: [String: [String]] = scores.getAllScores()
        var filteredSnapshots: [Snapshot] = GlobalVariables.originalFilteredSnapshots
        
        //Removes all instances of Any so they do not need to be filtered
        for (infoType, info) in general.getAllInfo()
        {
            if info == "Any"
            {
                generalFilter.removeValueForKey(infoType)
            }
        }
        
        //Removes all blank scores bc they are unneeded
        for (scoreType, score) in scores.getAllScores()
        {
            if score[0] == "" && score[1] == ""
            {
                scoresFilter.removeValueForKey(scoreType)
            }
        }
        
        //Removes all Snapshots that aren't part of general filter
        if !generalFilter.isEmpty
        {
            for (infoType, info) in generalFilter
            {
                for snapshot in filteredSnapshots
                {
                    if snapshot.getInfo(infoType) != info
                    {
                        filteredSnapshots.removeAtIndex(findSnapshot(filteredSnapshots, snapshot: snapshot))
                    }
                }
                
            }
        }
        
        //Removes all Snapshots that aren't in specified range
        if !scoresFilter.isEmpty
        {
            for (scoreType, scores) in scoresFilter
            {
                for snapshot in filteredSnapshots
                {
                    if !snapshot.determineInRange(scoreType, values: scores)
                    {
                        filteredSnapshots.removeAtIndex(findSnapshot(filteredSnapshots, snapshot: snapshot))
                    }
                }
            }
        }
        
        GlobalVariables.filteredSnapshots = filteredSnapshots
        
    }
    
    // This function returns the index of a snapshot inside an array of snapshots
    func findSnapshot(allSnapshots: [Snapshot], snapshot: Snapshot) -> Int
    {
        for num in 0...allSnapshots.count
        {
            let temp = allSnapshots[num]
            
            if(temp.objectId == snapshot.objectId)
            {
                return num
            }
        }
        
        return -1
    }
    
}
