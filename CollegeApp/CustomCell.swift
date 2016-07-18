//
//  CustomCell.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/12/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    //Image stuff
    var image1: UIImage = UIImage()
    var imageview: UIImageView = UIImageView()
    
    //Text Label
    var universityL = UILabel()
    var classYearL = UILabel()
    var gpaL = UILabel()
    var satactL = UILabel()
    var decisionL = UILabel()
    
    //Information
    var classYear = UILabel()
    var gpa = UILabel()
    var satact = UILabel()
    var decision = UILabel()

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Image View
        imageview = UIImageView(frame: CGRectMake(30, 15, 65, 65))
        
        //Text Label
        universityL = UILabel(frame: CGRectMake(0, 85, 150, 21))
    
        classYearL = UILabel(frame: CGRectMake(160, 10, 77, 21))
        gpaL = UILabel(frame: CGRectMake(160, 35, 42, 21))
        satactL = UILabel(frame: CGRectMake(160, 60, 97, 21))
        decisionL = UILabel(frame: CGRectMake(160, 85, 97, 21))
        
        //Information
        classYear = UILabel(frame: CGRectMake(243, 10, 77, 21))
        gpa = UILabel(frame: CGRectMake(243, 35, 42, 21))
        satact = UILabel(frame: CGRectMake(243, 60, 97, 21))
        decision = UILabel(frame: CGRectMake(243, 85, 97, 21))
        
        self.contentView.addSubview(imageview)
        self.contentView.addSubview(universityL)
        self.contentView.addSubview(classYearL)
        self.contentView.addSubview(gpaL)
        self.contentView.addSubview(satactL)
        self.contentView.addSubview(decisionL)
        self.contentView.addSubview(classYear)
        self.contentView.addSubview(gpa)
        self.contentView.addSubview(satact)
        self.contentView.addSubview(decision)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setAllLabels(snapshot: Snapshot)
    {
        for (name, img) in GlobalVariables.allImages
        {
            if snapshot.university == name
            {
                imageview.image = imageResize(img, sizeChange: CGSize(width: 75, height: 75))
                break
            }
            else
            {
                imageview.image = imageResize(UIImage(named: "logo.png")!, sizeChange: CGSize(width: 75, height: 75))
            }
        }
        
        universityL.text = snapshot.university
        universityL.textAlignment = NSTextAlignment.Center
        universityL.adjustsFontSizeToFitWidth = true
        classYearL.text = "Class: "
        gpaL.text = "GPA: "
        satactL.text = "SAT/ACT: "
        decisionL.text = "Decision: "
        
        //infromation text setter
        classYear.text = snapshot.year
        gpa.text = snapshot.gpa
        decision.text = snapshot.decision
        
        if snapshot.sat != "NA"
        {
            if snapshot.act != "NA"
            {
                satact.text = String(snapshot.sat) + " / " + String(snapshot.act)
            }
            else
            {
                satact.text = String(snapshot.sat) + " / -"
            }
        }
        else
        {
            satact.text = "- / " + String(snapshot.act)
        }

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
