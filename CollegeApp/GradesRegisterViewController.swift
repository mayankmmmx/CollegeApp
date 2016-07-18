//
//  GradesRegisterViewController.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 4/9/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit
import Parse

class GradesRegisterViewController: UIViewController {
    
    //UILabels
    var titleL: UILabel = UILabel()
    var satL: UILabel = UILabel()
    var satrL: UILabel = UILabel()
    var satwL: UILabel = UILabel()
    var satmL: UILabel = UILabel()
    var actL: UILabel = UILabel()
    var actrL: UILabel = UILabel()
    var actmL: UILabel = UILabel()
    var acteL: UILabel = UILabel()
    var actsL: UILabel = UILabel()
    var gpaL: UILabel = UILabel()
    var gpa2L: UILabel = UILabel()
    
    //UITextFields 1
    var sat1: UITextField = UITextField()
    var satr1: UITextField = UITextField()
    var satw1: UITextField = UITextField()
    var satm1: UITextField = UITextField()
    var act1: UITextField = UITextField()
    var actr1: UITextField = UITextField()
    var acte1: UITextField = UITextField()
    var actm1: UITextField = UITextField()
    var acts1: UITextField = UITextField()
    var gpa1: UITextField = UITextField()
    
    
    //Buttons
    var back: UIButton = UIButton()
    var next: UIButton = UIButton()
    
    var incrementHeight: CGFloat = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width
        let height = self.view.frame.height
       
        self.navigationController?.navigationBarHidden = true
        
        titleL.frame = CGRect(x: 0, y: height/17, width: width, height: height/25)
        
        incrementHeight = height/16
        
        //UILABELS Frame Settings
        satL.frame = CGRect(x: width/5, y: incrementingHeight(), width: width/10, height: height/25)
        satrL.frame = CGRect(x: width/4, y: incrementingHeight(), width: width/4, height: height/25)
        satwL.frame = CGRect(x: width/4, y: incrementingHeight(), width: width/4, height: height/25)
        satmL.frame = CGRect(x: width/4, y: incrementingHeight(), width: width/4, height: height/25)
        actL.frame = CGRect(x: width/5, y: incrementingHeight(), width: width/10, height: height/25)
        actrL.frame = CGRect(x: width/4, y: incrementingHeight(), width: width/4, height: height/25)
        acteL.frame = CGRect(x: width/4, y: incrementingHeight(), width: width/4, height: height/25)
        actmL.frame = CGRect(x: width/4, y: incrementingHeight(), width: width/4, height: height/25)
        actsL.frame = CGRect(x: width/4, y: incrementingHeight(), width: width/4, height: height/25)
        gpaL.frame = CGRect(x: width/5, y: incrementingHeight(), width: width/3, height: height/25)
        gpa2L.frame = CGRect(x: width/5*1.07, y: incrementingHeight()-self.view.frame.height/20, width: width/3, height: height/25)
        
        incrementHeight = height/16
        
        //UITEXTFIELDS 1 Frame Settings
        sat1.frame = CGRect(x: 1.75*width/5, y: incrementingHeight(), width: width/8, height: height/25)
        satr1.frame = CGRect(x: 2*width/4, y: incrementingHeight(), width: width/10, height: height/25)
        satw1.frame = CGRect(x: 2*width/4, y: incrementingHeight(), width: width/10, height: height/25)
        satm1.frame = CGRect(x: 2*width/4, y: incrementingHeight(), width: width/10, height: height/25)
        act1.frame = CGRect(x: 1.75*width/5, y: incrementingHeight(), width: width/15, height: height/25)
        actr1.frame = CGRect(x: 2*width/4, y: incrementingHeight(), width: width/15, height: height/25)
        acte1.frame = CGRect(x: 2*width/4, y: incrementingHeight(), width: width/15, height: height/25)
        actm1.frame = CGRect(x: 2*width/4, y: incrementingHeight(), width: width/15, height: height/25)
        acts1.frame = CGRect(x: 2*width/4, y: incrementingHeight(), width: width/15, height: height/25)
        gpa1.frame = CGRect(x: 1.75*width/5, y: incrementingHeight(), width: width/9, height: height/25)
        
        //UITextFields 1 Appearance Settings
        setTextField(sat1)
        setTextField(satr1)
        setTextField(satw1)
        setTextField(satm1)
        setTextField(act1)
        setTextField(actr1)
        setTextField(acte1)
        setTextField(actm1)
        setTextField(acts1)
        setTextField(gpa1)
        
        //Sets text for all Labels
        titleL.text = "Enter your current academic statistics"
        titleL.textAlignment = NSTextAlignment.Center
        titleL.adjustsFontSizeToFitWidth = true
        satL.text = "SAT: "
        satrL.text = "Reading: "
        satmL.text = "Math: "
        satwL.text = "Writing: "
        actL.text = "ACT: "
        actrL.text = "Reading: "
        acteL.text = "English: "
        actmL.text = "Math: "
        actsL.text = "Science: "
        gpaL.text = "GPA: "
        gpa2L.text = "(4.0)"
        gpa2L.font = UIFont(name: gpa2L.font.fontName, size: 12)
        
        //Set up buttons
        next = UIButton(frame: CGRect(x: width/2 + width/32, y: height*0.85, width: width/4, height: height/15))
        back = UIButton(frame: CGRect(x: width/2-width/4-width/32, y: height*0.85, width: width/4, height: height/15))
        
        //add text and style
        back.setTitle("Back", forState: UIControlState.Normal)
        back.setTitleColor(self.view.tintColor, forState: UIControlState.Normal)
        back.layer.borderWidth = 1
        back.layer.cornerRadius = 5
        back.layer.borderColor = self.view.tintColor.CGColor
        
        next.setTitle("Next", forState: UIControlState.Normal)
        next.setTitleColor(self.view.tintColor, forState: UIControlState.Normal)
        next.layer.borderWidth = 1
        next.layer.cornerRadius = 5
        next.layer.borderColor = self.view.tintColor.CGColor
        
        //add button action
        back.addTarget(self, action: "goBack:", forControlEvents: UIControlEvents.TouchDown)
        next.addTarget(self, action: "goNext:", forControlEvents: UIControlEvents.TouchDown)

        
        //Adds everything subview
        self.view.addSubview(titleL)
        self.view.addSubview(satL)
        self.view.addSubview(satrL)
        self.view.addSubview(satwL)
        self.view.addSubview(satmL)
        self.view.addSubview(actL)
        self.view.addSubview(actrL)
        self.view.addSubview(actmL)
        self.view.addSubview(acteL)
        self.view.addSubview(actsL)
        self.view.addSubview(gpaL)
        self.view.addSubview(gpa2L)
        self.view.addSubview(sat1)
        self.view.addSubview(satr1)
        self.view.addSubview(satw1)
        self.view.addSubview(satm1)
        self.view.addSubview(act1)
        self.view.addSubview(actr1)
        self.view.addSubview(actm1)
        self.view.addSubview(acte1)
        self.view.addSubview(acts1)
        self.view.addSubview(gpa1)
        self.view.addSubview(back)
        self.view.addSubview(next)
        
        resetAll()
    }
    //Increments height by constant everytime function is called
    func incrementingHeight() -> CGFloat
    {
        let height = self.view.frame.height
        incrementHeight += height/14
        return incrementHeight
    }
    
    func setTextField(field: UITextField)
    {
        field.layer.borderColor = self.view.tintColor.CGColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 5
        field.textAlignment = NSTextAlignment.Center
    }
    
    func resetAll()
    {
        sat1.text = ""
        satr1.text = ""
        satw1.text = ""
        satm1.text = ""
        act1.text = ""
        actr1.text = ""
        acte1.text = ""
        actm1.text = ""
        acts1.text = ""
        gpa1.text = ""
    }
    
    func getAllScores() -> [String]
    {
        var allScores: [String] = []
        
        //SAT Low to High
        allScores.append(sat1.text!)
        
        //SATR Low To High
        allScores.append(satr1.text!)
        
        //SATW Low to High
        allScores.append(satw1.text!)
    
        //SATM Low to High
        allScores.append(satm1.text!)
        
        //ACT Low to High
        allScores.append(act1.text!)
        
        //ACTR Low to High
        allScores.append(actr1.text!)
        
        //ACTE Low to High
        allScores.append(acte1.text!)
        
        //ACTM Low to High
        allScores.append(actm1.text!)
        
        //ACTS Low to High
        allScores.append(acts1.text!)
        
        //GPA Low to High
        allScores.append(gpa1.text!)
        
        return allScores
    }
    
    func goNext(sender: UIButton)
    {
        performSegueWithIdentifier("showFavorites", sender: self)
        GlobalVariables.newScores = getAllScores()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        sat1.endEditing(true)
        satr1.endEditing(true)
        satw1.endEditing(true)
        satm1.endEditing(true)
        act1.endEditing(true)
        actr1.endEditing(true)
        acte1.endEditing(true)
        actm1.endEditing(true)
        acts1.endEditing(true)
        gpa1.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
}