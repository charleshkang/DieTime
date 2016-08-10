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
    
    @IBOutlet weak var agePicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    let dateFormatter = NSDateFormatter()
    
    let lifeExpectancy = LifeExpectancyService()
    let pickerData = ["Male", "Female"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        lifeExpectancy.getLifeInfo()
    }

    @IBAction func showDeathTouchUpInside(sender: AnyObject)
    {

    }
    
    @IBAction func datePickerChanged(sender: AnyObject)
    {
        setDate()
    }
    
    func setDate()
    {
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        print(dateFormatter.stringFromDate(datePicker.date))
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

