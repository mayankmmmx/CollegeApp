//
//  RegisterViewController.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 4/8/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    var usernameLabel: UILabel = UILabel()
    var passwordLabel: UILabel = UILabel()
    var verifyPasswordLabel: UILabel = UILabel()
    var emailLabel: UILabel = UILabel()
    
    var username: UITextField = UITextField()
    var password: UITextField = UITextField()
    var verifyPassword: UITextField = UITextField()
    var email: UITextField = UITextField()
    
    var close: UIButton = UIButton()
    var next: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = self.view.frame.width
        let height = self.view.frame.height
        
        self.navigationController?.navigationBarHidden = true
        
        //Set up labels & text fields
        usernameLabel = UILabel(frame: CGRect(x: (width-width/2)/2, y: height*0.10, width: width/2, height: height/25))
        passwordLabel = UILabel(frame: CGRect(x: (width-width/2)/2, y: height*0.30, width: width/2, height: height/25))
        verifyPasswordLabel = UILabel(frame: CGRect(x: (width-width/2)/2, y: height*0.50, width: width/2, height: height/25))
        emailLabel = UILabel(frame: CGRect(x: (width-width/2)/2, y: height*0.70, width: width/2, height: height/25))
       
        username = UITextField(frame: CGRect(x: (width-width/2)/2, y: height*0.15, width: width/2, height: height/25))
        password = UITextField(frame: CGRect(x: (width-width/2)/2, y: height*0.35, width: width/2, height: height/25))
        verifyPassword = UITextField(frame: CGRect(x: (width-width/2)/2, y: height*0.55, width: width/2, height: height/25))
        email = UITextField(frame: CGRect(x: (width-width/2)/2, y: height*0.75, width: width/2, height: height/25))
        
        //Label styling
        usernameLabel.text = "Enter Username"
        passwordLabel.text = "Enter Password"
        verifyPasswordLabel.text = "Verify Password"
        emailLabel.text = "Enter Email"
        usernameLabel.textAlignment = NSTextAlignment.Center
        passwordLabel.textAlignment = NSTextAlignment.Center
        verifyPasswordLabel.textAlignment = NSTextAlignment.Center
        emailLabel.textAlignment = NSTextAlignment.Center
        
        //UITextField Styling
        username.layer.borderColor = self.view.tintColor.CGColor
        username.layer.borderWidth = 1
        username.layer.cornerRadius = 5
        
        password.layer.borderColor = self.view.tintColor.CGColor
        password.layer.borderWidth = 1
        password.layer.cornerRadius = 5
        password.secureTextEntry = true
        
        verifyPassword.layer.borderColor = self.view.tintColor.CGColor
        verifyPassword.layer.borderWidth = 1
        verifyPassword.layer.cornerRadius = 5
        verifyPassword.secureTextEntry = true
        
        email.layer.borderColor = self.view.tintColor.CGColor
        email.layer.borderWidth = 1
        email.layer.cornerRadius = 5

        //Set up buttons
        next = UIButton(frame: CGRect(x: width/2 + width/32, y: height*0.85, width: width/4, height: height/15))
        close = UIButton(frame: CGRect(x: width/2-width/4-width/32, y: height*0.85, width: width/4, height: height/15))
        
        //add text and style
        close.setTitle("Cancel", forState: UIControlState.Normal)
        close.setTitleColor(self.view.tintColor, forState: UIControlState.Normal)
        close.layer.borderWidth = 1
        close.layer.cornerRadius = 5
        close.layer.borderColor = self.view.tintColor.CGColor
        
        next.setTitle("Next", forState: UIControlState.Normal)
        next.setTitleColor(self.view.tintColor, forState: UIControlState.Normal)
        next.layer.borderWidth = 1
        next.layer.cornerRadius = 5
        next.layer.borderColor = self.view.tintColor.CGColor

        //add button action
        close.addTarget(self, action: "cancelRegistration:", forControlEvents: UIControlEvents.TouchDown)
        next.addTarget(self, action: "registerAccount:", forControlEvents: UIControlEvents.TouchDown)
        
        //add to view
        self.view.addSubview(usernameLabel)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(verifyPasswordLabel)
        self.view.addSubview(emailLabel)
        self.view.addSubview(username)
        self.view.addSubview(password)
        self.view.addSubview(verifyPassword)
        self.view.addSubview(email)
        self.view.addSubview(close)
        self.view.addSubview(next)
        
    }
    
    func cancelRegistration(sender: UIButton)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func registerAccount(sender: UIButton)
    {
        var canContinue = true
        GlobalVariables.newUsername = username.text!.lowercaseString
        
        if email.text!.rangeOfString("@") != nil
        {
            GlobalVariables.newEmail = email.text!.lowercaseString
        }
        else
        {
            print("error. incorrect email")
            canContinue = false
        }
        
        if password.text == verifyPassword.text
        {
            GlobalVariables.newPassword = password.text!
        }
        else
        {
            print("passwords do not match")
            canContinue = false
        }
        
        if canContinue
        {
            //ADD POP UP BOX THAT SAYS REGITRATION SUCCESSFUL
            
            performSegueWithIdentifier("showGradesRegister", sender: self)
            
            //dismissViewControllerAnimated(true, completion: nil)
            
        }
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.username.endEditing(true)
        self.password.endEditing(true)
        self.verifyPassword.endEditing(true)
        self.email.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
}



/*

university
college
year
sat
println("SATCR: " + String(satcr))
println("SATM: " + String(satm))
println("SATW: " + String(satw))
println("ACT: " + String(act))
println("ACTR: " + String(actr))
println("ACTM: " + String(actm))
println("ACTE: " + String(acte))
println("ACTS: " + String(acts))
println("GPA: " + gpa)
println("State: " + state)
println("Decision: " + decision)
println("Race: " + race)
println("Gender: " + gender)
println("Legacy: " + legacy)


var universityLabel: UILabel = UILabel()
var collegeLabel: UILabel = UILabel()
var yearLabel: UILabel = UILabel()
var stateLabel: UILabel = UILabel()
var decisionLabel: UILabel = UILabel()

*/