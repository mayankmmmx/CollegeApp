//
//  GlobalVariables.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/18/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import Foundation
import UIKit

struct GlobalVariables {
    
    static var allSnapshots: [Snapshot] = []
    static var originalFilteredSnapshots: [Snapshot] = []
    static var filteredSnapshots: [Snapshot] = []
    static var favoriteSnapshots: [Snapshot] = []
    static var currentCollege: String = ""
    static var screenSize: CGRect = UIScreen.mainScreen().bounds
    static var screenWidth = screenSize.width
    static var screenHeight = screenSize.height
    static var deviceID = ""
    static var isLoggedIn = false
    static var newUsername = ""
    static var newPassword = ""
    static var newEmail = ""
    static var newScores: [String] = []
    static var allImages: [String: UIImage] = [String: UIImage]()
}