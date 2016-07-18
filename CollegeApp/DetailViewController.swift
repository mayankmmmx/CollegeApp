//
//  DetailViewController.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/5/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
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
    
    //Height incrementer
    var incrementHeight: CGFloat = 0
    
    //OUTPUT TEXTFIELD
    var comments: UITextField = UITextField()
    
    //UIIMAGEVIEW
    var imageView: UIImageView = UIImageView()
    
    //DIVIDER LINE
    var line: UIView = UIView()
    
    var detailItem: Snapshot? {
        didSet {
            // Update the view.
            //incrementHeight = 0
            //configureView()
            print("didset")
        }
    }
    func configureView()
    {
        let height = self.view.frame.height
        let width  = self.view.frame.width
        
        //Set Top Label dimensions
        incrementHeight = height/30
        incrementingHeight()
        decisionLabel.frame = CGRect(x: (width - (width/10) )/2, y: incrementingHeight(), width: width/4, height: height/25)
        appliedLabel.frame = CGRect(x: (width - (width/10) )/2, y: incrementingHeight(), width: width/5, height: height/25)
        collegeLabel.frame = CGRect(x: (width - (width/10) )/2, y: incrementingHeight(), width: width/5, height: height/25)
        stateLabel.frame = CGRect(x: (width - (width/10) )/2, y: incrementingHeight(), width: width/5, height: height/25)
        classYearLabel.frame = CGRect(x: (width - (width/10) )/2, y: incrementingHeight(), width: width/5, height: height/25)
        universityLabel.frame = CGRect(x: 0, y: incrementHeight, width: (width - (width/6) )/2, height: height/25)
        
        //Set imageview dimensions
        imageView.frame = CGRect(x: 0, y: decisionLabel.frame.minY, width: (width - (width/6) )/2, height: universityLabel.frame.minY-decisionLabel.frame.minY)
        
        incrementingHeight()
        
        //Set Bottom Label dimensions
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
        decisionLabel.text = "Decision:"
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
        appliedLabel.adjustsFontSizeToFitWidth = true
        appliedLabel.font = UIFont.boldSystemFontOfSize(decisionLabel.font.pointSize)
        collegeLabel.adjustsFontSizeToFitWidth = true
        collegeLabel.font = UIFont.boldSystemFontOfSize(decisionLabel.font.pointSize)
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
        incrementHeight = height/30
        incrementingHeight()
        decision.frame = CGRect(x: decisionLabel.frame.maxX - width/40, y: incrementingHeight(), width: width/4, height: height/25)
        applied.frame = CGRect(x: decisionLabel.frame.maxX - width/40, y: incrementingHeight(), width: width/5, height: height/25)
        college.frame = CGRect(x: decisionLabel.frame.maxX - width/40, y: incrementingHeight(), width: width/5, height: height/25)
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

//        comments.text = "helloio;efjiwfjiwejfifefjeifjeifjeifjiefjeifjeifjeifjeifjeifjeifjeifjeifjejfifewfjiefjeiwfjiwejfiewjfildsfjk;oiweajc"
        
        decision.textAlignment = NSTextAlignment.Left
        
        if let snapshot: Snapshot = self.detailItem {
            universityLabel.text = snapshot.university
            universityLabel.textAlignment = NSTextAlignment.Center
            universityLabel.adjustsFontSizeToFitWidth = true
            
            for (name, img) in GlobalVariables.allImages
            {
                if snapshot.university == name
                {
                    imageView.image = imageResize(img, sizeChange: CGSize(width: 75, height: 75))
                    break
                }
                else
                {
                    imageView.image = imageResize(UIImage(named: "logo.png")!, sizeChange: CGSize(width: 75, height: 75))
                }
            }
            decision.text = snapshot.decision
            applied.text = snapshot.applicationType
            college.text = snapshot.college
            state.text = snapshot.state
            classYear.text = snapshot.year
            gpa.text = snapshot.gpa
            sat.text = snapshot.satw
            satr.text = snapshot.satcr
            satw.text = snapshot.satw
            satm.text = snapshot.satm
            act.text = snapshot.act
            actr.text = snapshot.actr
            acte.text = snapshot.acte
            actm.text = snapshot.actm
            acts.text = snapshot.acts
            race.text = snapshot.race
            gender.text = snapshot.gender
            legacy.text = snapshot.legacy
            //comments.text = snapshot.
            
            
        }
        
        self.view.addSubview(universityLabel)
        self.view.addSubview(imageView)
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
        self.view.addSubview(comments)
    }
    
    func incrementingHeight() -> CGFloat
    {
        let height = self.view.frame.height
        incrementHeight += height/20
        return incrementHeight
    }
    /*func configureView() {
        // Update the user interface for the detail item.
        
        if let snapshot: Snapshot = self.detailItem {
            if let _imageView = self.imageview {
                
                //if(snapshot.university == "Stanford University")
                //{
                _imageView.image = imageResize(UIImage(named: "stanford.png")!, sizeChange: CGSize(width: 150, height: 129))
                //}
                //else {_imageView.image = UIImage()}
            }
            if let _university = self.university {
                _university.text = snapshot.university
                _university.textAlignment = NSTextAlignment.Center
                _university.adjustsFontSizeToFitWidth = true
            }
            if let _decision = self.decision {
                _decision.text = snapshot.decision
                _decision.adjustsFontSizeToFitWidth = true
            }
            if let _applied = self.applied {
                _applied.text = snapshot.applicationType
                _applied.adjustsFontSizeToFitWidth = true
                
            }
            if let _college = self.college {
                _college.text = snapshot.college
                _college.adjustsFontSizeToFitWidth = true
            }
            if let _state = self.state {
                _state.text = snapshot.state
                _state.adjustsFontSizeToFitWidth = true
            }
            if let _classYear = self.classYear {
                _classYear.text = String(snapshot.year)
                _classYear.adjustsFontSizeToFitWidth = true
            }
            if let _gpa = self.gpa {
                _gpa.text = snapshot.gpa
                _gpa.adjustsFontSizeToFitWidth = true
            }
            if let _sat = self.sat {
                
                _sat.text = String(snapshot.sat)
                _sat.adjustsFontSizeToFitWidth = true
                if let _satr = self.satr {_satr.text = snapshot.satcr; _satr.adjustsFontSizeToFitWidth = true}
                if let _satm = self.satm {_satm.text = String(snapshot.satm); _satm.adjustsFontSizeToFitWidth = true}
                if let _satw = self.satw {_satw.text = String(snapshot.satw); _satw.adjustsFontSizeToFitWidth = true}
            }
            if let _act = self.act {
                
                _act.text = String(snapshot.act)
                _act.adjustsFontSizeToFitWidth = true
                if let _actr = self.actr {_actr.text = snapshot.actr; actr.adjustsFontSizeToFitWidth = true}
                if let _acte = self.acte {_acte.text = snapshot.acte; acte.adjustsFontSizeToFitWidth = true}
                if let _actm = self.actm {_actm.text = snapshot.actm; actm.adjustsFontSizeToFitWidth = true}
                if let _acts = self.acts {_acts.text = snapshot.acts; acts.adjustsFontSizeToFitWidth = true}
                
            }
            if let _race = self.race {
                _race.text = snapshot.race
                _race.adjustsFontSizeToFitWidth = true
                
            }
            if let _gender = self.gender {
                _gender.text = snapshot.gender
                _gender.adjustsFontSizeToFitWidth = true
                
            }
            if let _legacy = self.legacy {
                _legacy.text = snapshot.legacy
                _legacy.adjustsFontSizeToFitWidth = true
            }
            
            if let _additionalComments = self.additionalComments {
                additionalComments.editable = false
                additionalComments.scrollEnabled = false
                additionalComments.text = "N/A"
            }
        }
    }*/
    
    func imageResize (imageObj:UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = true
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
        print("view did load")
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

