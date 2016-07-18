 //
//  SnapshotLoader.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/7/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import Parse
 
class SnapshotLoader
{
    var allSnapshots: [Snapshot] = []

    init()
    {
        allSnapshots = []
        generateAllSnapshots()
        GlobalVariables.allSnapshots = allSnapshots
    }

    private func generateAllSnapshots()
    {
        var tempArray: [Snapshot] = []
        var tempSnapshot: Snapshot = Snapshot()
        Parse.setApplicationId("SiH1iCXUup82SW5chQyyOnemuZ1BiPDxhKpENQJ7", clientKey: "2xB4udgQUnAlEaQgVFGVhTL17NBzm4n8mg62IZuK")
        let query = PFQuery(className: "Snapshot")
        query.cachePolicy = PFCachePolicy.NetworkElseCache
        let temp: [AnyObject] = query.findObjects()!
        var currentUser = PFUser.currentUser()
        var userSchools = currentUser?.valueForKey("Favorites") as! [String]
        
        for obj in temp
        {
            if(userSchools.contains(obj.objectForKey("University")!.description))
            {
                var tempStr = (obj.objectForKey("Decision")!.description).componentsSeparatedByString("-")
                
                tempSnapshot = Snapshot(_university: obj.objectForKey("University")!.description, _college: obj.objectForKey("College")!.description, _year: obj.objectForKey("ClassYear")!.integerValue, _sat: obj.objectForKey("SAT")!.integerValue, _satcr: obj.objectForKey("SATCR")!.integerValue, _satm: obj.objectForKey("SATM")!.integerValue, _satw: obj.objectForKey("SATW")!.integerValue, _act: obj.objectForKey("ACT")!.integerValue, _actr: obj.objectForKey("ACTR")!.integerValue, _actm: obj.objectForKey("ACTM")!.integerValue, _acte: obj.objectForKey("ACTE")!.integerValue, _acts: obj.objectForKey("ACTS")!.integerValue, _gpa: obj.objectForKey("GPA")!.doubleValue, _state: obj.objectForKey("State")!.description, _decision: tempStr[1], _applicationType: tempStr[0], _race: obj.objectForKey("Race")!.description, _gender: obj.objectForKey("Gender")!.description, _legacy: obj.objectForKey("Legacy")!.boolValue, _objectID: obj.objectId)
                
                tempArray.append(tempSnapshot)
            }
        }
        
        for snapshot in tempArray
        {
            allSnapshots.append(snapshot)
        }
        
        var tempArray2: [String: UIImage] = [String: UIImage]()
        let query2 = PFQuery(className: "Images")
        let temp2: [AnyObject] = query2.findObjects()!
        
        print(temp2.count)
        
        for obj2 in temp2
        {
            let userPicture = obj2.valueForKey("image")! as! PFFile
            let imageData = userPicture.getData()
            let image = UIImage(data:imageData!)
            GlobalVariables.allImages[obj2.objectForKey("name")!.description] = image
        }
        
    }
    
    func getSnapshots() -> [Snapshot]
    {
        return allSnapshots
    }
}