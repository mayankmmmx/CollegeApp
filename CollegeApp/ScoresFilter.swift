//
//  ScoresFilter.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/23/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit

class ScoresFilter: UIView {
    
    //UILabels
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
    
    //UITextFields 2
    var sat2: UITextField = UITextField()
    var satr2: UITextField = UITextField()
    var satw2: UITextField = UITextField()
    var satm2: UITextField = UITextField()
    var act2: UITextField = UITextField()
    var actr2: UITextField = UITextField()
    var acte2: UITextField = UITextField()
    var actm2: UITextField = UITextField()
    var acts2: UITextField = UITextField()
    var gpa2: UITextField = UITextField()
    
    var incrementHeight: CGFloat = 0;
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let width = self.frame.width
        let height = self.frame.height
        
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
        gpa2L.frame = CGRect(x: width/5*1.07, y: incrementingHeight()-self.frame.height/20, width: width/3, height: height/25)
        
        incrementHeight = 0
        
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
        
        //resets height
        incrementHeight = 0
        
        //UITEXTFIELDS 2 Frame Settings
        sat2.frame = CGRect(x: 3*width/5, y: incrementingHeight(), width: width/8, height: height/25)
        satr2.frame = CGRect(x: 2.8*width/4, y: incrementingHeight(), width: width/10, height: height/25)
        satw2.frame = CGRect(x: 2.8*width/4, y: incrementingHeight(), width: width/10, height: height/25)
        satm2.frame = CGRect(x: 2.8*width/4, y: incrementingHeight(), width: width/10, height: height/25)
        act2.frame = CGRect(x: 2*width/4, y: incrementingHeight(), width: width/15, height: height/25)
        actr2.frame = CGRect(x: 2.8*width/4, y: incrementingHeight(), width: width/15, height: height/25)
        acte2.frame = CGRect(x: 2.8*width/4, y: incrementingHeight(), width: width/15, height: height/25)
        actm2.frame = CGRect(x: 2.8*width/4, y: incrementingHeight(), width: width/15, height: height/25)
        acts2.frame = CGRect(x: 2.8*width/4, y: incrementingHeight(), width: width/15, height: height/25)
        gpa2.frame = CGRect(x: 3*width/5, y: incrementingHeight(), width: width/9, height: height/25)
        
        //UITextfields 2 Appearance Settings
        setTextField(sat2)
        setTextField(satr2)
        setTextField(satw2)
        setTextField(satm2)
        setTextField(act2)
        setTextField(actr2)
        setTextField(acte2)
        setTextField(actm2)
        setTextField(acts2)
        setTextField(gpa2)

        
        //Resets height
        incrementHeight = 0;
        
        //Adds the "to" between UITextfield 1 and 2
        for i in 0...9
        {
            let toLabel: UILabel = UILabel()
            
            if i == 0 || i == 9 //first and last
            {
                toLabel.frame = CGRect(x: 2.55*width/5, y: incrementingHeight(), width: width/10, height: height/25)
            }
            else if i == 4 //middle
            {
                toLabel.frame = CGRect(x: 1.75*width/4, y: incrementingHeight(), width: width/10, height: height/25)
            }
            else //others
            {
                toLabel.frame = CGRect(x: 2.5*width/4, y: incrementingHeight(), width: width/10, height: height/25)
            }
            
            toLabel.text = "to"
            self.addSubview(toLabel)
        }
        
        //Sets text for all Labels
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
            
        //Adds everything subview
        self.addSubview(satL)
        self.addSubview(satrL)
        self.addSubview(satwL)
        self.addSubview(satmL)
        self.addSubview(actL)
        self.addSubview(actrL)
        self.addSubview(actmL)
        self.addSubview(acteL)
        self.addSubview(actsL)
        self.addSubview(gpaL)
        self.addSubview(gpa2L)
        self.addSubview(sat1)
        self.addSubview(satr1)
        self.addSubview(satw1)
        self.addSubview(satm1)
        self.addSubview(act1)
        self.addSubview(actr1)
        self.addSubview(actm1)
        self.addSubview(acte1)
        self.addSubview(acts1)
        self.addSubview(gpa1)
        self.addSubview(sat2)
        self.addSubview(satr2)
        self.addSubview(satw2)
        self.addSubview(satm2)
        self.addSubview(act2)
        self.addSubview(actr2)
        self.addSubview(actm2)
        self.addSubview(acte2)
        self.addSubview(acts2)
        self.addSubview(gpa2)
        
        resetAll()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Increments height by constant everytime function is called
    func incrementingHeight() -> CGFloat
    {
        let height = self.frame.height
        incrementHeight += height/12
        return incrementHeight
    }
    
    func setTextField(field: UITextField)
    {
        field.layer.borderColor = self.tintColor.CGColor
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
        sat2.text = ""
        satr2.text = ""
        satw2.text = ""
        satm2.text = ""
        act2.text = ""
        actr2.text = ""
        acte2.text = ""
        actm2.text = ""
        acts2.text = ""
        gpa2.text = ""

    }
    
    func getAllScores() -> [String: [String]]
    {
        var allScores: [String: [String]] = [:]
        
        //SAT Low to High
        allScores["sat"] = [sat1.text!, sat2.text!]
        
        //SATR Low To High
        allScores["satr"] = [satr1.text!, satr2.text!]
        
        //SATW Low to High
        allScores["satw"] = [satw1.text!, satw2.text!]
        
        //SATM Low to High
        allScores["satm"] = [satm1.text!, satm2.text!]
        
        //ACT Low to High
        allScores["act"] = [act1.text!, act2.text!]
        
        //ACTR Low to High
        allScores["actr"] = [actr1.text!, actr2.text!]
        
        //ACTE Low to High
        allScores["acte"] = [acte1.text!, acte2.text!]
        
        //ACTM Low to High
        allScores["actm"] = [actm1.text!, actm2.text!]
        
        //ACTS Low to High
        allScores["acts"] = [acts1.text!, acts2.text!]
        
        //GPA Low to High
        allScores["gpa"] = [gpa1.text!, gpa2.text!]
        
        return allScores
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
        sat2.endEditing(true)
        satr2.endEditing(true)
        satw2.endEditing(true)
        satm2.endEditing(true)
        act2.endEditing(true)
        actr2.endEditing(true)
        acte2.endEditing(true)
        actm2.endEditing(true)
        acts2.endEditing(true)
        gpa2.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    

}
