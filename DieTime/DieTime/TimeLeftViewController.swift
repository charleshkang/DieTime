//
//  LifeViewController.swift
//  DieTime
//
//  Created by Charles Kang on 8/10/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import UIKit

class TimeLeftViewController: UIViewController
{
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    let dateFormatter = NSDateFormatter()
    let date = NSDate()
    
    let lifeExpectanctyService = LifeExpectancyService()
    
    let pickerData = ["Male", "Female"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lifeExpectanctyService.getLifeInfo()
        lifeExpectanctyService.delegate = self
    }
    
    @IBAction func showDeathTouchUpInside(sender: AnyObject)
    {
        // Grab the day, month, and year (in that order), as well as gender from the date picker and picker view.
        // Use that data to construct the url to fetch
        
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker)
    {
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        print(dateFormatter.stringFromDate(datePicker.date))
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components([.Day , .Month , .Year], fromDate: datePicker.date)
        let year = components.year
        let month = components.month
        let day = components.day
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerData[row]
    }
}

extension TimeLeftViewController: LifeExpectancyServiceDelegate
{
    func setLifeExpectancy(lifeExpectancy: LifeExpectancy)
    {
        
    }
}

