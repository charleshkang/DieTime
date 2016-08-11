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
    let currentAge: Double
    let yearsLeft: Double
    let monthsLeft: Double
    let daysLeft: Double
    let lifeComplete: Double
    
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