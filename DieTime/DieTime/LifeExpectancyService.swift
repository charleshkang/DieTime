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
}

    func getLifeInfo()
    {
//        let urlString = "https://life-left.p.mashape.com/time-left?birth=\(day)+\(month)+\(year)&gender=male"
        let urlString = "https://life-left.p.mashape.com/time-left?birth=14+April+1955&gender=male"
        guard let url = NSURL(string: urlString) else { return }
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            guard let data = data else { return }
            let json = JSON(data: data)
            let currentAge = json["data"]["currentAge"].float
            let yearsLeft = json["data"]["yearsLeft"].float
            let monthsLeft = json["data"]["monthsLeft"].float
            let daysLeft = json["data"]["daysLeft"].float
            let lifeComplete = json["data"]["lifeComplete"].float
        }
        task.resume()
    }



// http://www.theapiurl.com/time-left?param1=value&param2=value2


/*
 
 let url = NSURL(string: "http://www.theapiurl.com/time-left?param1=value&param2=value2”)
 let request = NSMutableURLRequest(URL: url)
 request.setValue("your-api-key", forHTTPHeaderField: "X-Mashape-Key")
 
 let task = session.dataTaskWithRequest(request) { (data, response, error) in
 if error == nil {
 ….
 }
 }
 
 task.resume()
 */