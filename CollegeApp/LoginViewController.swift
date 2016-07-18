//
//  LoginViewController.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 4/4/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    private var usernameLabel: UILabel = UILabel()
    private var passwordLabel: UILabel = UILabel()
    private var usernameField: UITextField = UITextField()
    private var passwordField: UITextField = UITextField()
    private var signIn: UIButton = UIButton()
    private var forgotPass: UIButton = UIButton()
    private var register: UIButton = UIButton()
    private var imageview: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let width = self.view.frame.width
        let height = self.view.frame.height
        
        //Create field dimensions
        usernameLabel = UILabel(frame: CGRect(x: (width-width/2)/2, y: height*0.25, width: width/2, height: height/25))
        passwordLabel = UILabel(frame: CGRect(x: (width-width/2)/2, y: height*0.40, width: width/2, height: height/25))
        usernameField = UITextField(frame: CGRect(x: (width-width/2)/2, y: height*0.30, width: width/2, height: height/25))
        passwordField = UITextField(frame: CGRect(x: (width-width/2)/2, y: height*0.45, width: width/2, height: height/25))
        
        //style text fields
        usernameField.layer.borderColor = self.view.tintColor.CGColor
        usernameField.layer.borderWidth = 1
        usernameField.layer.cornerRadius = 5
        
        passwordField.layer.borderColor = self.view.tintColor.CGColor
        passwordField.layer.borderWidth = 1
        passwordField.layer.cornerRadius = 5
        passwordField.secureTextEntry = true
        
        //style labels and set default text
        usernameLabel.textAlignment = NSTextAlignment.Center
        usernameLabel.text = "Username"
        passwordLabel.textAlignment = NSTextAlignment.Center
        passwordLabel.text = "Password"
        
        
        //format buttons
        signIn = UIButton(frame: CGRect(x: width/2 + width/32, y: height*0.55, width: width/4, height: height/15))
        register = UIButton(frame: CGRect(x: width/2-width/4-width/32, y: height*0.55, width: width/4, height: height/15))
        forgotPass = UIButton(frame: CGRect(x: width/4, y: height*0.62, width: width/2, height: height/15))
        
        //add text and style
        signIn.setTitle("Sign In", forState: UIControlState.Normal)
        signIn.setTitleColor(self.view.tintColor, forState: UIControlState.Normal)
        signIn.layer.borderWidth = 1
        signIn.layer.cornerRadius = 5
        signIn.layer.borderColor = self.view.tintColor.CGColor
        
        register.setTitle("Register", forState: UIControlState.Normal)
        register.setTitleColor(self.view.tintColor, forState: UIControlState.Normal)
        register.layer.borderWidth = 1
        register.layer.cornerRadius = 5
        register.layer.borderColor = self.view.tintColor.CGColor
        
        forgotPass.setTitle("Forgot Password", forState: UIControlState.Normal)
        forgotPass.setTitleColor(self.view.tintColor, forState: UIControlState.Normal)
        
        
        //add actions
        signIn.addTarget(self, action: "signingIn:", forControlEvents: UIControlEvents.TouchDown)
        register.addTarget(self, action: "registerNow:", forControlEvents: UIControlEvents.TouchDown)
        
        imageview = UIImageView(frame: CGRectMake(width/4, 0,  width/2, height/4))
        //imageview.image = imageResize(UIImage(named: "stanford.png")!, sizeChange: CGSize(width: 100, height: 100))
        
        //add all to view
        self.view.addSubview(usernameLabel)
        self.view.addSubview(usernameField)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(passwordField)
        self.view.addSubview(signIn)
        self.view.addSubview(register)
        //self.view.addSubview(forgotPass)
        self.view.addSubview(imageview)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
                
        GlobalVariables.isLoggedIn = determineLoggedIn()
        
        if(GlobalVariables.isLoggedIn)
        {
            performSegueWithIdentifier("showFeed", sender: self)
        }
        
    }
    
    func registerNow(sender: UIButton)
    {
        self.performSegueWithIdentifier("showRegister", sender: self)
    }
    
    func signingIn(sender: UIButton)
    {
        let username = usernameField.text
        let password = passwordField.text
        Parse.setApplicationId("SiH1iCXUup82SW5chQyyOnemuZ1BiPDxhKpENQJ7", clientKey: "2xB4udgQUnAlEaQgVFGVhTL17NBzm4n8mg62IZuK")

        PFUser.logInWithUsername(username!, password: password!)
        
        var user = PFUser.logInWithUsername(username!, password: password!)
        
        print(user)
        
        if user != nil {
            print("successful login")
            self.performSegueWithIdentifier("showFeed", sender: self)
            
        } else {
            print("incorrect login")
            let alert = UIAlertController(title: "Incorrect Login", message: "Username or Password Incorrect. Please try again.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
     
     //   self.performSegueWithIdentifier("showFeed", sender: self)
        
    }

    func determineLoggedIn() -> Bool
    {
        Parse.setApplicationId("SiH1iCXUup82SW5chQyyOnemuZ1BiPDxhKpENQJ7", clientKey: "2xB4udgQUnAlEaQgVFGVhTL17NBzm4n8mg62IZuK")
        let query = PFUser.query()
        query!.whereKey("deviceID", equalTo: GlobalVariables.deviceID)
        query!.cachePolicy = PFCachePolicy.NetworkElseCache
        let user = query!.findObjects() as! [PFUser]
        
        if user.count == 1
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.usernameField.endEditing(true)
        self.passwordField.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
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
