//
//  GeneralFilter.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/25/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit

class GeneralFilter: UIView {
    
    //UILabels
    var state: UILabel = UILabel()
    var year: UILabel = UILabel()
    var decision: UILabel = UILabel()
    var applicationType: UILabel = UILabel()
    var race: UILabel = UILabel()
    var gender: UILabel = UILabel()
    var legacy: UILabel = UILabel()
    
    //Segmented Controls
    var decisionControl: UISegmentedControl = UISegmentedControl()
    var applicationTypeControl: UISegmentedControl = UISegmentedControl()
    var genderControl: UISegmentedControl = UISegmentedControl()
    var legacyControl: UISegmentedControl = UISegmentedControl()
    
    //UITextFields
    var stateField: UITextField = UITextField()
    var yearField: UITextField = UITextField()
    var raceField: UITextField = UITextField()
    
    //CustomPickers
    var statePicker: CustomPicker = CustomPicker()
    var yearPicker: CustomPicker = CustomPicker()
    var racePicker: CustomPicker = CustomPicker()
    
    //Picker View Content Arrays
    var stateContent: [String] = ["Any"]
    var yearContent: [String] = ["Any"]
    var raceContent: [String] = ["Any"]
    
    //Decision Type Array
    var decisionTypes: [String] = ["Any"]
    
    //Height incrementer
    var incrementHeight: CGFloat = 0
    var incrementHeight2: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let width = self.frame.width
        let height = self.frame.height
        
        incrementHeight = height/12 //starting height

        //UILabel Frames
        state.frame = CGRect(x: (width-46)/2, y: incrementHeight, width: 46, height: height/25)
        year.frame = CGRect(x: (width-86)/2, y: incrementingHeight(), width: 86, height: height/25)
        decision.frame = CGRect(x: (width-71)/2, y: incrementingHeight(), width: 71, height: height/25)
        applicationType.frame = CGRect(x: (width-64)/2, y: incrementingHeight(), width: 64, height: height/25)
        race.frame = CGRect(x: (width-45)/2, y: incrementingHeight(), width: 45, height: height/25)
        gender.frame = CGRect(x: (width-62)/2, y: incrementingHeight(), width: 62, height: height/25)
        legacy.frame = CGRect(x: (width-61)/2, y: incrementingHeight(), width: 61, height: height/25)
        
        //UITextfield Frames
        stateField = UITextField(frame: CGRectMake((width-(width/2))/2, (state.frame.minY + year.frame.minY)/2, width/2, height/24))
        yearField = UITextField(frame: CGRectMake((width-(width/4))/2, (year.frame.minY + decision.frame.minY)/2, width/4, height/24))
        raceField = UITextField(frame: CGRectMake((width-(width/2))/2, (race.frame.minY + gender.frame.minY)/2, width/2, height/24))
        
        //UITextField Border Style
        stateField.layer.borderColor = self.tintColor.CGColor
        stateField.layer.borderWidth = 1
        stateField.layer.cornerRadius = 5
        
        yearField.layer.borderColor = self.tintColor.CGColor
        yearField.layer.borderWidth = 1
        yearField.layer.cornerRadius = 5
        
        raceField.layer.borderColor = self.tintColor.CGColor
        raceField.layer.borderWidth = 1
        raceField.layer.cornerRadius = 5
        
        //UITextField Text Settings
        stateField.textAlignment = NSTextAlignment.Center
        yearField.textAlignment = NSTextAlignment.Center
        raceField.textAlignment = NSTextAlignment.Center
        
        //UITextField Original Text
        stateField.text = "Any"
        yearField.text = "Any"
        raceField.text = "Any"
        
        //Set content for CustomPickers
        applyContent()
        
        //Add Content to CustomPickers
        statePicker.setContent(stateContent)
        yearPicker.setContent(yearContent)
        racePicker.setContent(raceContent)
        
        //Add Custom Pickers to UITextfields
        stateField.inputView = statePicker
        yearField.inputView = yearPicker
        raceField.inputView = racePicker
       
        //Set Segmented Control Values
        decisionControl = UISegmentedControl(items: ["Any","Accepted", "Waitlisted", "Denied"])
        applicationTypeControl = UISegmentedControl(items: decisionTypes)
        genderControl = UISegmentedControl(items: ["Any", "Male", "Female"])
        legacyControl = UISegmentedControl(items: ["Any", "Yes", "No"])
    
        incrementHeight = height/12 //starting height
        
        //Segmented Control Frames
        incrementHeight2 = (state.frame.height + year.frame.height) / 4
        incrementingHeight2()
        incrementingHeight2()
        decisionControl.frame = CGRect(x: (width-decisionControl.frame.width)/2, y: incrementingHeight2(), width: decisionControl.frame.width, height: decisionControl.frame.height)
        applicationTypeControl.frame = CGRect(x: (width-applicationTypeControl.frame.width)/2, y: incrementingHeight2(), width: applicationTypeControl.frame.width, height: applicationTypeControl.frame.height)
        incrementingHeight2()
        genderControl.frame = CGRect(x: (width-genderControl.frame.width)/2, y: incrementingHeight2(), width: genderControl.frame.width, height: genderControl.frame.height)
        legacyControl.frame = CGRect(x: (width-legacyControl.frame.width)/2, y: incrementingHeight2(), width: legacyControl.frame.width, height: legacyControl.frame.height)
        
        //Set Label Values
        state.text = "State:"
        year.text = "Class Year:"
        decision.text = "Decision:"
        applicationType.text = "Applied:"
        race.text = "Race:"
        gender.text = "Gender:"
        legacy.text = "Legacy:"
        
        //Add everything to subview
        self.addSubview(state)
        self.addSubview(year)
        self.addSubview(decision)
        self.addSubview(applicationType)
        self.addSubview(race)
        self.addSubview(gender)
        self.addSubview(legacy)
        self.addSubview(decisionControl)
        self.addSubview(applicationTypeControl)
        self.addSubview(genderControl)
        self.addSubview(legacyControl)
        self.addSubview(stateField)
        self.addSubview(yearField)
        self.addSubview(raceField)
        
        //reset everything
        resetAll()
       
    }

   /* override init() {
        super.init()
    }*/
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func incrementingHeight() -> CGFloat
    {
        let height = self.frame.height
        incrementHeight += height/9
        return incrementHeight
    }
    
    func incrementingHeight2() -> CGFloat
    {
        let height = self.frame.height
        incrementHeight2 += height/9
        return incrementHeight2
    }
    
    func applyContent()
    {
        if(GlobalVariables.currentCollege == "All Colleges")
        {
            for college in GlobalVariables.allSnapshots
            {
                if(!stateContent.contains(college.state) && college.state != "NA"){stateContent.append(college.state)}
                if(!yearContent.contains(college.year) && college.year != "NA"){yearContent.append(college.year)}
                if(!raceContent.contains(college.race) && college.race != "NA"){raceContent.append(college.race)}
                if(!decisionTypes.contains(college.applicationType) && college.applicationType != "NA"){decisionTypes.append(college.applicationType)}
            }
        }
        else
        {
            for college in GlobalVariables.allSnapshots
            {
                if(college.university == GlobalVariables.currentCollege)
                {
                    if(!stateContent.contains(college.state) && college.state != "NA"){stateContent.append(college.state)}
                    if(!yearContent.contains(college.year) && college.year != "NA"){yearContent.append(college.year)}
                    if(!raceContent.contains(college.race) && college.race != "NA"){raceContent.append(college.race)}
                    if(!decisionTypes.contains(college.applicationType) && college.applicationType != "NA"){decisionTypes.append(college.applicationType)}
                }
            }
        }
    }
    
    func resetAll()
    {
        decisionControl.selectedSegmentIndex = 0
        applicationTypeControl.selectedSegmentIndex = 0
        genderControl.selectedSegmentIndex = 0
        legacyControl.selectedSegmentIndex = 0
        stateField.text = stateContent[0]
        yearField.text = yearContent[0]
        raceField.text = raceContent[0]
    }
    
    func getAllInfo() -> [String: String]
    {
        var allInfo: [String: String] = [:]
        state.text = "State:"
        year.text = "Class Year:"
        decision.text = "Decision:"
        applicationType.text = "Applied:"
        race.text = "Race:"
        gender.text = "Gender:"
        legacy.text = "Legacy:"
        
        allInfo["state"] = stateField.text
        allInfo["year"] = yearField.text
        allInfo["decision"] = decisionControl.titleForSegmentAtIndex(decisionControl.selectedSegmentIndex)
        allInfo["applicationType"] = applicationTypeControl.titleForSegmentAtIndex(applicationTypeControl.selectedSegmentIndex)
        allInfo["race"] = raceField.text
        allInfo["gender"] = genderControl.titleForSegmentAtIndex(genderControl.selectedSegmentIndex)
        allInfo["legacy"] = legacyControl.titleForSegmentAtIndex(legacyControl.selectedSegmentIndex)
        
        return allInfo
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.endEditing(true)
        
        stateField.text = stateContent[statePicker.getCurrentIndex()]
        yearField.text = yearContent[yearPicker.getCurrentIndex()]
        raceField.text = raceContent[racePicker.getCurrentIndex()]
        
        super.touchesBegan(touches, withEvent: event)
    }
    
}