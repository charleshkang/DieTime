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
            if let age = json["data"]["currentAge"].number {
                print(age)
            }
            let currentAge = json["data"]["currentAge"].number
            print(currentAge)
        }
        task.resume()
    }
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