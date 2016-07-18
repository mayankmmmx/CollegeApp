//
//  CustomPicker.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 4/1/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import UIKit

class CustomPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var contents: [String] = []
    var currentSelectedIndex = 0
    //var toolBar: UIToolbar = UIToolbar()
    //var doneButton: UIBarButtonItem = UIBarButtonItem()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
        self.showsSelectionIndicator = true
        self.opaque = false
    }
    
    func setContent(content: [String])
    {
        contents = content
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1;
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return contents.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!
    {
        return contents[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        currentSelectedIndex = row
    }
    
    func getCurrentIndex() -> Int
    {
        return currentSelectedIndex
    }
}
