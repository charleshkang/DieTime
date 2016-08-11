//
//  LifeExpectancyManager.swift
//  DieTime
//
//  Created by Charles Kang on 8/10/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol LifeExpectancyServiceDelegate: class
{
    func setLifeExpectancy(lifeExpectancy: LifeExpectancy)
}

class LifeExpectancyService
{
    weak var delegate: LifeExpectancyServiceDelegate?
    
    func getLifeInfo()
    {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = [
            "X-Mashape-Key" : "jY0bEhHCBpmsh8j1mpA5p11tCJGyp1tok3Zjsn4ubbvNNp5Jt3"
        ]
        let session = NSURLSession(configuration: configuration)
        
        let urlString = "https://life-left.p.mashape.com/time-left?birth=14+April+1955&gender=male"
        guard let url = NSURL(string: urlString) else { return }
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            guard let data = data else { return }
            let json = JSON(data: data)
            guard
                let age = json["data"]["currentAge"].double,
                let yearsLeft = json["data"]["yearsLeft"].double,
                let monthsLeft = json["data"]["monthsLeft"].double,
                let daysLeft = json["data"]["daysLeft"].double,
                let percentageOfLifeCompleted = json["data"]["lifeComplete"].double
                else { return }
            
            let lifeExpectancy = LifeExpectancy(date: NSDate(), currentAge: age, yearsLeft: yearsLeft, monthsLeft: monthsLeft, daysLeft: daysLeft, lifeComplete: percentageOfLifeCompleted)
            dispatch_async(dispatch_get_main_queue(), { [weak self] () -> Void in
                self?.delegate?.setLifeExpectancy(lifeExpectancy)
                })
        }
        task.resume()
    }
}

// http://www.theapiurl.com/time-left?param1=value&param2=value2