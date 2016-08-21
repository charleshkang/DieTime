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
    let currentAge: Double
    let yearsLeft: Double
    let monthsLeft: Double
    let daysLeft: Double
    let lifeComplete: Double
}

enum Gender: String
{
    case male
    case female
    
    static let allValues: [Gender] = [.male, .female]
}