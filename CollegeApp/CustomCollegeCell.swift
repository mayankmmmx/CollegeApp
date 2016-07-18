//
//  CustomCollegeCell.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/18/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit

class CustomCollegeCell: UITableViewCell {
    
    //Image stuff
    var imageview: UIImageView = UIImageView()
    
   //Text Label
    var label: UILabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageview = UIImageView(frame: CGRectMake(15, 20, 75, 75))
        label = UILabel(frame: CGRectMake(100, 48, 200, 21))
        
        self.addSubview(imageview)
        self.addSubview(label)
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
    
    func setAllLabels(collegeName: String)
    {

        for (name, img) in GlobalVariables.allImages
        {
            if collegeName == name
            {
                imageview.image = imageResize(img, sizeChange: CGSize(width: 75, height: 75))
                break
            }
            else
            {
                imageview.image = imageResize(UIImage(named: "logo.png")!, sizeChange: CGSize(width: 75, height: 75))
            }
        }
        
        label.text = collegeName
        label.adjustsFontSizeToFitWidth = true
        
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
