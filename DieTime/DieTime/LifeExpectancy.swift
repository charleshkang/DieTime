//
//  LifeExpectancyManager.swift
//  DieTime
//
//  Created by Charles Kang on 8/10/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import Foundation

struct LifeExpectancy
{
    let date: NSDate
    let gender: String
    
    let currentAge: Float
    let yearsLeft: Float
    let monthsLeft: Float
    let daysLeft: Float
    let lifeComplete: Float
    
    var dateString: String {
        get {
            let df = NSDateFormatter()
            df.dateFormat = "d MMMM YYYY"
            df.locale = NSLocale.currentLocale()
            return df.stringFromDate(date)
        }
    }
}
let today = NSDate()

/*
 
 
 {
 "data": {
 "currentAge": 61.32559612319254,
 "yearsLeft": 20.519058868837522,
 "monthsLeft": 246.22870642605028,
 "daysLeft": 7494.586251842905,
 "hoursLeft": 179870.0700442297,
 "minutesLeft": 10792204.202653782,
 "secondsLeft": 647532252.1592269,
 "dateString": "20 years 6 months 6 days 23 hours 3 minutes 59 seconds",
 "date": {
 "years": 20,
 "months": 6,
 "days": 6,
 "hours": 23,
 "minutes": 3,
 "seconds": 59
 },
 "lifeComplete": 0.7492926218476254
 },
 "success": true
 }
 
 */


