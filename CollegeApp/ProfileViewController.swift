//
//  ProfileViewController.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 4/26/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    //
    //  DetailViewController.swift
    //  CollegeApp
    //
    //  Created by Mayank Makwana on 3/5/15.
    //  Copyright (c) 2015 Mayank Makwana. All rights reserved.
    //
        
    //LABELS
    var universityLabel: UILabel = UILabel()
    var decisionLabel: UILabel = UILabel()
    var appliedLabel: UILabel = UILabel()
    var collegeLabel: UILabel = UILabel()
    var stateLabel: UILabel = UILabel()
    var classYearLabel: UILabel = UILabel()
    var gpaLabel: UILabel = UILabel()
    var satLabel: UILabel = UILabel()
    var satrLabel: UILabel = UILabel()
    var satmLabel: UILabel = UILabel()
    var satwLabel: UILabel = UILabel()
    var actLabel: UILabel = UILabel()
    var actrLabel: UILabel = UILabel()
    var acteLabel: UILabel = UILabel()
    var actmLabel: UILabel = UILabel()
    var actsLabel: UILabel = UILabel()
    var raceLabel: UILabel = UILabel()
    var genderLabel: UILabel = UILabel()
    var legacyLabel: UILabel = UILabel()
    var commentsLabel: UILabel = UILabel()
    
    //OUTPUT LABELS
    var decision: UILabel = UILabel()
    var applied: UILabel = UILabel()
    var college: UILabel = UILabel()
    var state: UILabel = UILabel()
    var classYear: UILabel = UILabel()
    var gpa: UILabel = UILabel()
    var sat: UILabel = UILabel()
    var satr: UILabel = UILabel()
    var satm: UILabel = UILabel()
    var satw: UILabel = UILabel()
    var act: UILabel = UILabel()
    var actr: UILabel = UILabel()
    var acte: UILabel = UILabel()
    var actm: UILabel = UILabel()
    var acts: UILabel = UILabel()
    var race: UILabel = UILabel()
    var gender: UILabel = UILabel()
    var legacy: UILabel = UILabel()
    
    var imageview: UIImageView = UIImageView()
    
    //Height incrementer
    var incrementHeight: CGFloat = 0
    
    //OUTPUT TEXTFIELD
    var comments: UITextField = UITextField()
    
    //DIVIDER LINE
    var line: UIView = UIView()
    
    //LOGOUT BUTTON
    var logout: UIButton = UIButton()
    
    func configureView()
    {
        let height = self.view.frame.height
        let width  = self.view.frame.width
        
        //Set Top Label dimensions
        
        decisionLabel.frame = CGRect(x: 0, y: width/2, width: width, height: height/25)
        
        var collegeIncrement: CGFloat = width/2 + height/10
        var allnames: [String] = []
        
        for snapshot in GlobalVariables.allSnapshots
        {
            if(!allnames.contains(snapshot.university))
            {
               allnames.append(snapshot.university)
            }
        }
        
        var maxH: CGFloat = 0
        
        for name in allnames
        {
            let tempLabel: UILabel = UILabel(frame: CGRect(x: 0, y: collegeIncrement, width: width, height: height/25))
            tempLabel.textAlignment = NSTextAlignment.Center
            tempLabel.text = name
            self.view.addSubview(tempLabel)
            maxH = tempLabel.frame.minY
            collegeIncrement += height/20
        }
        
        
       //Used for alignment
        universityLabel.frame = CGRect(x: 0, y: incrementHeight, width: (width - (width/6) )/2, height: height/25)

        incrementHeight = maxH
                
        //Set Bottom Label dimensions
     //   stateLabel.frame = CGRect(x:universityLabel.frame.minX + width/20, y: incrementingHeight(), width: width/5, height: height/25)
    //    classYearLabel.frame = CGRect(x: width/2, y: incrementHeight, width: width/5, height: height/25)
        gpaLabel.frame = CGRect(x: universityLabel.frame.minX + width/20, y: incrementingHeight(), width: width/9, height: height/25)
        genderLabel.frame = CGRect(x: width/2, y: incrementHeight , width: width/5, height: height/25)
        satLabel.frame = CGRect(x: universityLabel.frame.minX + width/20, y: incrementingHeight(), width: width/9, height: height/25)
        actLabel.frame = CGRect(x: width/2, y: incrementHeight, width: width/9  , height: height/25)
        incrementHeight += height/30
        satrLabel.frame = CGRect(x: universityLabel.frame.minX + width/10, y: incrementHeight, width: width/5, height: height/25)
        actrLabel.frame = CGRect(x: width/2 + width/10, y: incrementHeight, width: width/5, height: height/25)
        incrementHeight += height/30
        satmLabel.frame = CGRect(x: universityLabel.frame.minX + width/10, y: incrementHeight, width: width/5, height: height/25)
        acteLabel.frame = CGRect(x: width/2 + width/10, y: incrementHeight, width: width/5, height: height/25)
        incrementHeight += height/30
        satwLabel.frame = CGRect(x: universityLabel.frame.minX + width/10, y: incrementHeight, width: width/5, height: height/25)
        actmLabel.frame = CGRect(x: width/2 + width/10, y: incrementHeight, width: width/5, height: height/25)
        incrementHeight += height/30
        actsLabel.frame = CGRect(x: width/2 + width/10, y: incrementHeight, width: width/5, height: height/25)
        raceLabel.frame = CGRect(x: universityLabel.frame.minX + width/20, y: incrementingHeight(), width: width/5, height: height/25)
        legacyLabel.frame = CGRect(x: width/2, y: incrementHeight , width: width/5, height: height/25)
        commentsLabel.frame = CGRect(x: universityLabel.frame.minX + width/20, y: incrementingHeight(), width: width/2, height: height/25)
        
        //Line
        //view.frame = CGRect(x: 0, y: universityLabel.frame.maxY + height/25, width: 10, height: 5)
        //view.backgroundColor = UIColor.blackColor()
        
        //Strings
        decisionLabel.text = "My Colleges"
        appliedLabel.text = "Applied:"
        collegeLabel.text = "College:"
        stateLabel.text = "State:"
        classYearLabel.text = "Class:"
        gpaLabel.text = "GPA:"
        satLabel.text = "SAT:"
        satrLabel.text = "Reading:"
        satmLabel.text = "Math:"
        satwLabel.text = "Writing:"
        actLabel.text = "ACT:"
        actrLabel.text = "Reading:"
        acteLabel.text = "English:"
        actmLabel.text = "Math:"
        actsLabel.text = "Science:"
        raceLabel.text = "Race:"
        genderLabel.text = "Gender:"
        legacyLabel.text = "Legacy:"
        //   commentsLabel.text = "Additional Comments:"
        commentsLabel.text = ""
        
        
        //Bold Style Top Fonts
        decisionLabel.adjustsFontSizeToFitWidth = true
        decisionLabel.font = UIFont.boldSystemFontOfSize(decisionLabel.font.pointSize)
        decisionLabel.textAlignment = NSTextAlignment.Center
        stateLabel.adjustsFontSizeToFitWidth = true
        stateLabel.font = UIFont.boldSystemFontOfSize(decisionLabel.font.pointSize)
        classYearLabel.adjustsFontSizeToFitWidth = true
        classYearLabel.font = UIFont.boldSystemFontOfSize(decisionLabel.font.pointSize)
        
        //Bold Style Bottom Fonts
        gpaLabel.adjustsFontSizeToFitWidth = true
        gpaLabel.font = UIFont.boldSystemFontOfSize(gpaLabel.font.pointSize)
        satLabel.adjustsFontSizeToFitWidth = true
        satLabel.font = UIFont.boldSystemFontOfSize(satLabel.font.pointSize)
        actLabel.adjustsFontSizeToFitWidth = true
        actLabel.font = UIFont.boldSystemFontOfSize(actLabel.font.pointSize)
        raceLabel.adjustsFontSizeToFitWidth = true
        raceLabel.font = UIFont.boldSystemFontOfSize(raceLabel.font.pointSize)
        genderLabel.adjustsFontSizeToFitWidth = true
        genderLabel.font = UIFont.boldSystemFontOfSize(genderLabel.font.pointSize)
        legacyLabel.adjustsFontSizeToFitWidth = true
        legacyLabel.font = UIFont.boldSystemFontOfSize(legacyLabel.font.pointSize)
        commentsLabel.adjustsFontSizeToFitWidth = true
        commentsLabel.font = UIFont.boldSystemFontOfSize(commentsLabel.font.pointSize)
        
        //Bold Style Italic Font
        satrLabel.adjustsFontSizeToFitWidth = true
        satrLabel.font = UIFont(name: UIFont.fontNamesForFamilyName("Helvetica")[4] , size: satrLabel.font.pointSize)
        satmLabel.adjustsFontSizeToFitWidth = true
        satmLabel.font = UIFont(name: UIFont.fontNamesForFamilyName("Helvetica")[4] , size: satrLabel.font.pointSize)
        satwLabel.adjustsFontSizeToFitWidth = true
        satwLabel.font = UIFont(name: UIFont.fontNamesForFamilyName("Helvetica")[4] , size: satwLabel.font.pointSize)
        actrLabel.adjustsFontSizeToFitWidth = true
        actrLabel.font = UIFont(name: UIFont.fontNamesForFamilyName("Helvetica")[4] , size: actrLabel.font.pointSize)
        acteLabel.adjustsFontSizeToFitWidth = true
        acteLabel.font = UIFont(name: UIFont.fontNamesForFamilyName("Helvetica")[4] , size: acteLabel.font.pointSize)
        actmLabel.adjustsFontSizeToFitWidth = true
        actmLabel.font = UIFont(name: UIFont.fontNamesForFamilyName("Helvetica")[4] , size: actmLabel.font.pointSize)
        actsLabel.adjustsFontSizeToFitWidth = true
        actsLabel.font = UIFont(name: UIFont.fontNamesForFamilyName("Helvetica")[4] , size: actsLabel.font.pointSize)
        
        //Set Result dimensions
        incrementHeight = height/5
        incrementingHeight()
        incrementHeight += height/60
        
        state.frame = CGRect(x: decisionLabel.frame.maxX - width/40, y: incrementingHeight(), width: width/3, height: height/25)
        classYear.frame = CGRect(x: decisionLabel.frame.maxX - width/40, y: incrementingHeight(), width: width/5, height: height/25)
        
        incrementingHeight()
        
        //Set result  dimensions
        gpa.frame = CGRect(x: gpaLabel.frame.maxX + width/40, y: incrementingHeight(), width: width/9, height: height/25)
        gender.frame = CGRect(x: genderLabel.frame.maxX , y: incrementHeight , width: width/5, height: height/25)
        sat.frame = CGRect(x: satLabel.frame.maxX + width/40, y: incrementingHeight(), width: width/9, height: height/25)
        act.frame = CGRect(x: actLabel.frame.maxX + width/40, y: incrementHeight, width: width/9  , height: height/25)
        incrementHeight += height/30
        satr.frame = CGRect(x: satrLabel.frame.maxX  + width/40, y: incrementHeight, width: width/5, height: height/25)
        actr.frame = CGRect(x: actrLabel.frame.maxX + width/40, y: incrementHeight, width: width/5, height: height/25)
        incrementHeight += height/30
        satm.frame = CGRect(x: satrLabel.frame.maxX + width/40, y: incrementHeight, width: width/5, height: height/25)
        acte.frame = CGRect(x: actrLabel.frame.maxX + width/40, y: incrementHeight, width: width/5, height: height/25)
        incrementHeight += height/30
        satw.frame = CGRect(x: satrLabel.frame.maxX + width/40, y: incrementHeight, width: width/5, height: height/25)
        actm.frame = CGRect(x: actrLabel.frame.maxX + width/40, y: incrementHeight, width: width/5, height: height/25)
        incrementHeight += height/30
        acts.frame = CGRect(x: actrLabel.frame.maxX + width/40, y: incrementHeight, width: width/5, height: height/25)
        race.frame = CGRect(x: gpaLabel.frame.maxX + width/40, y: incrementingHeight(), width: legacyLabel.frame.minX, height: height/25)
        legacy.frame = CGRect(x: genderLabel.frame.maxX , y: incrementHeight , width: width/5, height: height/25)
        //incrementingHeight()
        comments.frame = CGRect(x: commentsLabel.frame.minX, y: commentsLabel.frame.maxY, width: width/2, height: height-incrementHeight)
        
        let currentUser = PFUser.currentUser()
        var allInfo: [String] = currentUser?.valueForKey("Scores") as! [String]
        
        for num in 0...allInfo.count-1
        {
            if (allInfo[num] == "")
            {
                if(num == 9)
                {
                    allInfo[num] = "0.00"
                }
                else
                {
                    allInfo[num] = "0"
                }
                
            }
        }
        
    
       // state.text = snapshot.state
        gpa.text = allInfo[9]
        sat.text = allInfo[0]
        satr.text = allInfo[1]
        satw.text = allInfo[2]
        satm.text = allInfo[3]
        act.text = allInfo[4]
        actr.text = allInfo[5]
        acte.text = allInfo[6]
        actm.text = allInfo[7]
        acts.text = allInfo[8]
        race.text = "NA"
        gender.text = "NA"
        legacy.text = "NA"
            

        
        logout = UIButton(frame: CGRect(x: (width-width/3)/2, y: height - height/5, width: width/3, height: height/15))
        logout.setTitle("Logout", forState: UIControlState.Normal)
        logout.setTitleColor(self.view.tintColor, forState: UIControlState.Normal)
        logout.addTarget(self, action: "exit:", forControlEvents: UIControlEvents.TouchDown)
        
        
        imageview = UIImageView(frame: CGRectMake(width/4, height/24,  width/2, height/4))
        imageview.image = imageResize(UIImage(named: "logo.png")!, sizeChange: CGSize(width: 100, height: 100))

        
        self.view.addSubview(universityLabel)
        //self.view.addSubview(line)
        self.view.addSubview(decisionLabel)
        self.view.addSubview(appliedLabel)
        self.view.addSubview(collegeLabel)
        self.view.addSubview(stateLabel)
        self.view.addSubview(classYearLabel)
        self.view.addSubview(gpaLabel)
        self.view.addSubview(satLabel)
        self.view.addSubview(satrLabel)
        self.view.addSubview(satmLabel)
        self.view.addSubview(satwLabel)
        self.view.addSubview(actLabel)
        self.view.addSubview(actrLabel)
        self.view.addSubview(acteLabel)
        self.view.addSubview(actmLabel)
        self.view.addSubview(actsLabel)
        self.view.addSubview(raceLabel)
        self.view.addSubview(genderLabel)
        self.view.addSubview(legacyLabel)
        self.view.addSubview(commentsLabel)
        self.view.addSubview(decision)
        self.view.addSubview(applied)
        self.view.addSubview(college)
        self.view.addSubview(state)
        self.view.addSubview(classYear)
        self.view.addSubview(gpa)
        self.view.addSubview(sat)
        self.view.addSubview(satr)
        self.view.addSubview(satm)
        self.view.addSubview(satw)
        self.view.addSubview(act)
        self.view.addSubview(actr)
        self.view.addSubview(acte)
        self.view.addSubview(actm)
        self.view.addSubview(acts)
        self.view.addSubview(race)
        self.view.addSubview(gender)
        self.view.addSubview(legacy)
        self.view.addSubview(imageview)
        //self.view.addSubview(comments)
       // self.view.addSubview(logout)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func incrementingHeight() -> CGFloat
    {
        let height = self.view.frame.height
        incrementHeight += height/15
        return incrementHeight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func exit(sender: UIButton)
    {
        dismissViewControllerAnimated(true, completion: nil)
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
