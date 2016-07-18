//
//  Snapshot.swift
//  CollegeApp
//
//  Created by Mayank Makwana on 3/5/15.
//  Copyright (c) 2015 Mayank Makwana. All rights reserved.
//

import Foundation

class Snapshot {
    
    //normal vars
    var university: String
    var college: String
    private var iyear: Int
    private var isat: Int
    private var isatcr: Int
    private var isatm: Int
    private var isatw: Int
    private var iact: Int
    private var iactr: Int
    private var iactm: Int
    private var iacte: Int
    private var iacts: Int
    private var dgpa: Double
    var state: String
    var decision: String
    var applicationType: String
    var race: String
    var gender: String
    private var blegacy: Bool
    var objectId: String
    
    //changed 
    var year: String
    var sat: String
    var satcr: String
    var satm: String
    var satw: String
    var act: String
    var actr: String
    var actm: String
    var acte: String
    var acts: String
    var gpa: String
    var legacy: String
    
    init(_university: String!, _college: String!, _year: Int!, _sat: Int!, _satcr: Int!, _satm: Int!, _satw: Int!, _act: Int!, _actr: Int!, _actm: Int!, _acte: Int!, _acts: Int!, _gpa: Double!, _state: String!, _decision: String!, _applicationType: String!, _race: String!, _gender: String!, _legacy: Bool!, _objectID: String!)
    {
        university = _university
        college = _college
        iyear = _year
        isat = _sat
        isatcr = _satcr
        isatm = _satm
        isatw = _satw
        iact = _act
        iactr = _actr
        iactm = _actm
        iacte = _acte
        iacts = _acts
        dgpa = _gpa
        state = _state
        decision = _decision
        applicationType = _applicationType
        race = _race
        gender = _gender
        blegacy = _legacy
        objectId = _objectID
        
        year = ""
        sat = ""
        satcr = ""
        satm = ""
        satw = ""
        act = ""
        actr = ""
        acte = ""
        actm = ""
        acts = ""
        gpa = ""
        legacy = ""
        
        convertAll()
    }
    
    init()
    {
        university = ""
        college = ""
        iyear = 0
        isat = 0
        isatcr = 0
        isatm = 0
        isatw = 0
        iact = 0
        iactr = 0
        iactm = 0
        iacte = 0
        iacts = 0
        dgpa = 0
        state = ""
        decision = ""
        applicationType = ""
        race = ""
        gender = ""
        blegacy = false
        year = ""
        sat = ""
        satcr = ""
        satm = ""
        satw = ""
        act = ""
        actr = ""
        acte = ""
        actm = ""
        acts = ""
        gpa = ""
        legacy = ""
        objectId = ""
    }
    
    func convertAll()
    {
        university = stringConvert(university)
        college = stringConvert(college)
        year = intConvert(iyear)
        sat = intConvert(isat)
        satcr = intConvert(isatcr)
        satm = intConvert(isatm)
        satw = intConvert(isatw)
        act = intConvert(iact)
        actr = intConvert(iactr)
        acte = intConvert(iacte)
        actm = intConvert(iactm)
        acts = intConvert(iacts)
        gpa = doubleConvert(dgpa)
        state = stringConvert(state)
        decision = stringConvert(decision)
        applicationType = stringConvert(applicationType)
        race = stringConvert(race)
        gender = stringConvert(gender)
        legacy = boolConvert(blegacy)
        objectId = stringConvert(objectId)
    }
    
    func printSnapshot()
    {
        print("University: " + university)
        print("College: " + college)
        print("Year: " + String(year))
        print("SAT: " + String(sat))
        print("SATCR: " + String(satcr))
        print("SATM: " + String(satm))
        print("SATW: " + String(satw))
        print("ACT: " + String(act))
        print("ACTR: " + String(actr))
        print("ACTM: " + String(actm))
        print("ACTE: " + String(acte))
        print("ACTS: " + String(acts))
        print("GPA: " + gpa)
        print("State: " + state)
        print("Decision: " + decision)
        print("Race: " + race)
        print("Gender: " + gender)
        print("Legacy: " + legacy)
    }
    
    func intConvert(num: Int) -> String
    {
        if num == 0
        {
            return "NA"
        }
        else
        {
            return String(num)
        }
    }
    
    func doubleConvert(num: Double) -> String
    {
        if num == 0
        {
            return "NA"
        }
        else
        {
            return String(format:"%.2f", num)
        }
    }
    
    func stringConvert(str: String) -> String
    {
        if str == "0"
        {
            return "NA"
        }
        else
        {
            return str
        }
    }
    
    func boolConvert(boolVal: Bool) -> String
    {
        if boolVal
        {
            return "Yes"
        }
        else
        {
            return "No"
        }
    }
    
    func getInfo(keyword: String) -> String
    {
        if keyword == "state"
        {
            return state
        }
        
        else if keyword == "decision"
        {
            return decision
        }
        
        else if keyword == "applicationType"
        {
            return applicationType
        }
        
        else if keyword == "race"
        {
            return race
        }
        
        else if keyword == "gender"
        {
            return gender
        }
        
        else if keyword == "year"
        {
            return year
        }
        
        else if keyword == "legacy"
        {
            return legacy
        }
        
        else
        {
            return "error"
        }
    }
    
    func determineInRange(keyword: String, values: [String]) -> Bool
    {
        var current: Double = 0
        let low = (values[0] as NSString).doubleValue
        let high = (values[1] as NSString).doubleValue
        
        if keyword == "sat"{current = (sat as NSString).doubleValue}
        else if keyword == "satr"{current = (satcr as NSString).doubleValue}
        else if keyword == "satm"{current = (satm as NSString).doubleValue}
        else if keyword == "satw"{current = (satw as NSString).doubleValue}
        else if keyword == "act"{current = (act as NSString).doubleValue}
        else if keyword == "actr"{current = (actr as NSString).doubleValue}
        else if keyword == "acte"{current = (acte as NSString).doubleValue}
        else if keyword == "actm"{current = (actm as NSString).doubleValue}
        else if keyword == "acts"{current = (acts as NSString).doubleValue}
        else if keyword == "gpa"{current = (gpa as NSString).doubleValue}
        
        if current >= low && current <= high
        {
            return true
        }
        else
        {
            return false
        }
    }
    
}