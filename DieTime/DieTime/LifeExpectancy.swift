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
let manager = LifeExpectancy(date: today, gender: "male")

